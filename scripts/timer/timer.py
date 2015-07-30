#!/usr/bin/env python

import sys, signal, time
from os.path import expanduser

timesFile = expanduser('~') + '/dotfiles/scripts/timer/times'

def write(name, length):
    f = open(timesFile)
    times = f.read()
    f.close()

    nameExists = False
    lines = times.split('\n')
    newContent = ''
    for line in lines:
        tmp = line.split(':')
        if len(tmp) is 2 and tmp[0] == name:
            nameExists = True

            new = int(tmp[1]) + length
            line = '%s: %i' % (name, new)

        elif len(tmp) is not 2:
            break

        newContent = newContent + line + '\n'

    if not nameExists:
        f = open(timesFile, 'a')
        f.write('%s: %i\n' % (name, length))
        f.close()
    else:
        f = open(timesFile, 'w')
        f.write(newContent)
        f.close()

    print('\nrecorded %i seconds for %s' % (length, name))

def handler(signal, frame):
    length = int(time.time() - start)
    write(name, length)

    sys.exit(0)

if len(sys.argv) < 3:
    f = open(timesFile)
    for line in f:
        tmp = line.split(':')
        if len(tmp) is 2:
            name = tmp[0]
            length = int(tmp[1])
            hours = float(length) / 60 / 60
            print('%s: %.2f hours' % (name, hours))
    f.close()

if len(sys.argv) is 2:
    name = sys.argv[1]
    start = time.time()

    print('recording time for %s. press ^C to stop.' % name)
    signal.signal(signal.SIGINT, handler)
    signal.pause()
elif len(sys.argv) is 3 and sys.argv[1] == 'rm':
    name = sys.argv[2]
    f = open(timesFile)
    newContent = ''
    for line in f:
        tmp = line.split(':')
        if len(tmp) is 2 and tmp[0] != name:
            newContent = newContent + line
    
    f = open(timesFile, 'w')
    f.write(newContent)
    f.close()

    print('removed %s' % name)
