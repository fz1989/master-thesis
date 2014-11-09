#!/usr/bin/env python
#coding=utf-8

from merge import Task
from merge import Job
import numpy
import json

class SchedTask(Task):

    def __init__(self, cpu, mem):
        super(SchedTask, self).__init__(cpu, mem)
        self.work_time = numpy.random.randint(1, 50)
        self.state = "Pending"
        self.host = None

    def work(self, pre_task, is_merge):
        if self.state == "End":
            return 0
        idle = 0
        if pre_task == None:
            self.work_time -= 1
        else:
            if pre_task.state == "Running":
                idle = int(not is_merge)
            elif pre_task.state == "End":
                if self.state == "End":
                    return 0
                self.state = "Running"
                self.work_time -= 1
        if self.work_time == 0:
            self.state = "End"
        return idle

    def clean(self):
        if self.host:
            self.host.used_cpu -= self.cpu
            self.host.used_mem -= self.mem
        self.host = None

    def __repr__(self):
        return "%s,%d, %d, %d" % (self.state, self.cpu, self.mem, self.work_time)


class SchedJob(Job):

    def __init__(self, pre_task, next_task):
        self.pre_task = pre_task
        self.next_task = next_task
        self.state = "Pending"
        self.require_cpu = 0
        self.require_mem = 0

    def CBDRF_request(self):
        task = self.CBDRF()
        self.require_cpu = task.cpu
        self.require_mem = task.mem
        self.is_merge = True
        if self.require_cpu == self.pre_task.cpu + self.next_task.cpu:
            self.is_merge = False
        return self

    def other_request(self):
        task = self.other()
        self.is_merge = False
        self.require_cpu = task.cpu
        self.require_mem = task.mem
        return self

    def run(self):
        ret = (0,0,0)
        if self.state == "Running":
            self.pre_task.work(None, self.is_merge)
            idle = self.next_task.work(self.pre_task, self.is_merge)

            if self.next_task.state == "End":
                self.state = "End"
                if self.is_merge:
                    self.pre_task.host.used_cpu -= max(self.pre_task.cpu, self.next_task.cpu)
                    self.pre_task.host.used_mem -= max(self.pre_task.mem, self.next_task.mem)
                    self.pre_task.host = None
                    self.next_task.host = None
                else:
                    self.pre_task.clean()
                    self.next_task.clean()
            return (1,1,idle)
        return ret

    def get_resource(self, hosts):
        if self.state == "Pending":
            hosts.sort(key=lambda x:x.used_mem)
            for host in hosts:
                if host.cpu >= host.used_cpu + self.require_cpu and host.mem >= host.used_mem + self.require_mem:
                    host.used_mem += self.require_mem
                    host.used_cpu += self.require_cpu
                    self.pre_task.host = host
                    self.next_task.host = host
                    self.pre_task.state = "Running"
                    self.state = "Running"
                    return True
            return False

    def __repr__(self):
        return "%s, %d, %d" % (self.state, self.require_cpu, self.require_mem)

class Host(object):

    def __init__(self, cpu, mem, num):
        self.cpu = cpu
        self.mem = mem
        self.used_cpu = 0
        self.used_mem = 0
        self.num = num

    def set_attr(self, name, value):
        setattr(self, name, value)

    def __repr__(self):
        return "%d,%d,%d,%d," % (self.cpu, self.mem,self.used_cpu, self.used_mem)

def sched(hosts, jobs):

    def _add(x, y):
        return (x[0]+y[0], x[1]+y[1], x[2]+y[2])

    ret = reduce(lambda x, y: _add(x, y), map(lambda x: x.run(), jobs), (0,0,0))
    map(lambda x: x.get_resource(hosts), jobs)
    return hosts, jobs, ret[0], ret[1], ret[2]

def run_cluster(state):
    jobs = state["jobs"]
    hosts, jobs, run_jobs, running_task, idle_task = sched(state["hosts"], jobs=jobs)
    state["run_jobs"].append(run_jobs)
    state["running_task"].append(running_task)
    state["idle_task"].append(idle_task)
    ret = {"time": state["time"] - 1,
           "hosts": hosts,
           "jobs":jobs,
           "run_jobs": state["run_jobs"],
           "running_task": state["running_task"],
           "idle_task": state["idle_task"]}
    return ret

def start(state):
    if state["time"]:
        start(run_cluster(state))
    else:
        print state

if __name__ == "__main__":
    print "__main__" * 24 
    job_list = []
    other_job_list = []
    for i in xrange(1, 100):
        pre_cpu = numpy.random.randint(1,8)
        pre_mem = numpy.random.randint(1,8) * 2

        next_cpu = numpy.random.randint(1,8)
        next_mem = numpy.random.randint(1,8) * 2

        job_list.append(SchedJob(SchedTask(pre_cpu, pre_mem), SchedTask(next_cpu, next_mem)))
        other_job_list.append(SchedJob(SchedTask(pre_cpu, pre_mem), SchedTask(next_cpu, next_mem)))

    for job in job_list:
        print job
    print len(job_list)


    CBDRF_list = map(lambda x: x.CBDRF_request(), job_list)


    print "="*32
    for task in CBDRF_list:
        print task
    CBDRF_host = [Host(24,128,i) for i in range(0,8)]
    other_host = [Host(24,128,i) for i in range(0,8)]

    start({"time": 500,
           "hosts": CBDRF_host,
           "jobs":CBDRF_list,
           "run_jobs": [],
           "running_task": [],
           "idle_task": []})


    print "*"*32
    other_list = map(lambda x: x.other_request(), other_job_list)
    for task in other_list:
        print task

    start({"time": 500,
           "hosts": other_host,
           "jobs":  other_list,
           "run_jobs": [],
           "running_task": [],
           "idle_task": []})

