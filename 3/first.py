#!/usr/bin/env python3

data = open('input.txt').read().split('\n')

data = [ x for x in data if len(x) > 0 ]

WIDTH=len(data[0])

def filt(ts):
  return len([x for x in ts if x == '#'])

def main():
  trees = [ data[i][3 * i % WIDTH] for i in range(len(data)) ]
  print(filt(trees))

  vals = [
    filt([ data[i][1 * i % WIDTH] for i in range(len(data)) ]),
    filt([ data[i][3 * i % WIDTH] for i in range(len(data)) ]),
    filt([ data[i][5 * i % WIDTH] for i in range(len(data)) ]),
    filt([ data[i][7 * i % WIDTH] for i in range(len(data)) ]),
    filt([ data[2 * i][1 * i % WIDTH] for i in range(len(data)//2) ]),
  ]
  print(vals)
  print(vals[0] * vals[1] * vals[2] * vals[3] * vals[4])




main()

