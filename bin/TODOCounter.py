#!/bin/python3

import argparse
from time import sleep

def tfilter(line):
    return "TODO" in line

def count(file):
    with open(file, "r") as f:
        lines = f.readlines()
        return len(list(filter(tfilter, lines)))

def counter(file, interval):
    c = 0
    constant = 0
    while True:
        n = count(file)
        if c < n:
            print('\033[91m', n, '\033[0m')
            constant = 0
        elif c == n:
            constant += 1
            if constant == 10:
               print('\033[0m', n, '\033[0m')
        else:
            print('\033[92m', n, '\033[0m')
            constant = 0
        c = n
        sleep(interval)

if __name__=="__main__":
    parser = argparse.ArgumentParser(description="Count TODO")
    parser.add_argument('file')
    parser.add_argument('--interval', type=int, help='seconds', default=300)
    args = parser.parse_args()
    file = args.file
    interval = args.interval
    print("File", file)
    print("Interval", interval)
    counter(file, interval)
