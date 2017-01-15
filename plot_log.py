#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import sys
import glob

import numpy as np
import matplotlib.pyplot as plt

fig = plt.figure(figsize=(12, 8), dpi=96, facecolor='white')
ax1 = fig.add_subplot(1, 1, 1)

for logpath in sys.argv[1:]:
    ns = []
    avgs = []
    with open(logpath) as logfile:
        for line in logfile:
            if line[:1] == "#":
                continue
            row = line.strip().split("\t")
            n = int(row[0])
            avg = float(row[4])
            err = float(row[5])
            ns.append(n)
            avgs.append(avg)
            ax1.errorbar(n,avg,yerr=err, color='silver')
        ax1.plot(ns, avgs, label=logpath, zorder=3)

ax1.set_title('execution time')
ax1.set_xscale('log')
ax1.set_yscale('log')
ax1.set_xlabel('n')
ax1.set_ylabel('t (s)')
plt.legend(loc='upper left')

plt.tight_layout()
plt.show()
