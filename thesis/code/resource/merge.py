#!/usr/bin/env python
#coding=utf-8

import numpy
from matplotlib.font_manager import FontProperties
font = FontProperties(fname=r"c:\windows\fonts\simsun.ttf", size=14)

class Task(object):

    def __init__(self, cpu, mem):
        self.cpu = cpu
        self.mem = mem

    def __repr__(self):
        return "%d\t%d"%(self.cpu, self.mem)

    def add(self, task_other):
        return Task(self.cpu + task_other.cpu, self.mem + task_other.mem)

    def merge(self, task_other):
        if self.cpu <= task_other.cpu and self.mem <= task_other.mem:
            return Task(task_other.cpu, task_other.mem)
        elif self.cpu >= task_other.cpu and self.mem >= task_other.mem:
            return Task(self.cpu, self.mem)
        else:
            return self.add(task_other)

class Job(object):

    def __init__(self, pre_task, next_task):
        self.pre_task = pre_task
        self.next_task = next_task

    def __repr__(self):
        return "%s\t%s" % (str(self.pre_task), str(self.next_task))

    def CBDRF(self):
        return self.pre_task.merge(self.next_task)

    def other(self):
        return self.pre_task.add(self.next_task)

if __name__ == "__main__":
    job_list = []
    for i in xrange(1, 25):
        pre_cpu = numpy.random.randint(1,5)
        pre_mem = numpy.random.randint(1,5)

        next_cpu = numpy.random.randint(1,5)
        next_mem = numpy.random.randint(1,5)

        job_list.append(Job(Task(pre_cpu, pre_mem), Task(next_cpu, next_mem)))

    for job in job_list:
        print job

    CBDRF_list = map(lambda x: x.CBDRF(), job_list)
    print "="*32
    for task in CBDRF_list:
        print task

    print "="*32
    other_list = map(lambda x: x.other(), job_list)
    for task in other_list:
        print task
