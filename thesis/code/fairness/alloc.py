#!/usr/env python
#coding=utf-8

from gen import get_task_list

def Jains(value_list, N = None):
    if N is None:
        N = len(value_list)
    sum_value = sum(value_list)
    sum_square = sum([value * value for value in value_list])
    return 1.0 * sum_value * sum_value / N / sum_square


class Host(object):

    def __init__(self, cpu, mem):
        self.cpu = cpu
        self.mem = mem
        self.used_cpu = 0
        self.used_mem = 0

    def set_attr(self, name, value):
        setattr(self, name, value)

    def __repr__(self):
        return "%d,%d,%d,%d," % (self.cpu, self.mem,self.used_cpu, self.used_mem)



class HostManager(object):

    def __init__(self, num=8):
        self.num = num
        self.host_list = [Host(24, 128) for i in range(self.num)]

    def calc(self):
        self.sum_cpu = reduce(lambda x, y: x + y.cpu, self.host_list, 0.0)
        self.sum_mem = reduce(lambda x, y: x + y.mem, self.host_list, 0.0)

        def _calc(task):
            domain_share = max((task.used_cpu) / self.sum_cpu, (task.used_mem) /
                    self.sum_mem)
            task.set_attr("domain_share", domain_share)

        map(lambda x: _calc(x), self.host_list)

    def output(self):
        self.jains()
        for host in self.host_list:
            print host.used_cpu, host.used_mem, host.domain_share
        print "domain_jains", self.domain_jains
        print "cpu_jains", self.cpu_jains
        print "mem_jains", self.mem_jains

    def alloc(self):
        pass

    def jains(self):
        self.calc()
        domain_list = map(lambda x:x.domain_share, self.host_list)
        cpu_list = map(lambda x:x.used_cpu, self.host_list)
        mem_list = map(lambda x:x.used_mem, self.host_list)
        self.domain_jains = Jains(domain_list)
        self.cpu_jains = Jains(cpu_list)
        self.mem_jains = Jains(mem_list)

class CBHost(HostManager):

    def alloc(self, task):
        self.calc()
        self.host_list.sort(key=lambda x:x.domain_share)
        for host in self.host_list:
            if host.cpu >= host.used_cpu + task.cpu and host.mem >= host.used_mem + task.mem:
                host.used_mem += task.mem
                host.used_cpu += task.cpu
                return True
        return False

class FilterHost(HostManager):

    def alloc(self, task):
        self.host_list.sort(key=lambda x:x.used_mem)
        for host in self.host_list:
            if host.cpu >= host.used_cpu + task.cpu and host.mem >= host.used_mem + task.mem:
                host.used_mem += task.mem
                host.used_cpu += task.cpu
                return True
        return False


if __name__ == "__main__":
    task_list = get_task_list()
    CBDRF_list = sorted(task_list, key=lambda x:max(x.cpu, x.mem), reverse=True)
    print task_list
    print CBDRF_list
    CBDRF_host = CBHost()
    Filter_host = FilterHost()

    map(lambda x:CBDRF_host.alloc(x), CBDRF_list)
    print "=" * 18
    CBDRF_host.output()
    print "=" * 18

    map(lambda x:Filter_host.alloc(x), task_list)
    print "=" * 18
    Filter_host.output()
    print "=" * 18








