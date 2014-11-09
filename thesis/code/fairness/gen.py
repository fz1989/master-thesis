#!/usr/bin/env python
#coding=utf-8

import numpy

class Task(object):

    def __init__(self, cpu, mem):
        self.cpu = cpu
        self.mem = mem

    def __repr__(self):
        return ("%d,%d") % (self.cpu, self.mem)

def get_task_list():
    task_list = []
    for i in range(0,25):
        cpu = numpy.random.randint(1,8)
        mem = numpy.random.randint(1,8)
        task_list.append(Task(cpu, mem))
    return task_list

if __name__ == "__main__":
    task_list = get_task_list()
    for task in task_list:
        print task.cpu, task.mem
