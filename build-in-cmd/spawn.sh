#!/bin/bash
# spawon.sh         一个fork出多个自身实例的脚本

PIDS=$(pidof sh $0)     # 这个脚本不同实例的进程ID
P_array=( $PIDS )       # 把它们放到数组里(为什么? TODO ).
echo $PIDS              # 显示父进程和子进程的进程ID.

