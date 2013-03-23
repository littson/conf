#!/bin/sh
svn log --stop-on-copy -v $1|grep '^ '|tr -s ' '|sort -k3|uniq
