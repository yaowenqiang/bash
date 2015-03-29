#!/bin/bash
# true.sh               

# 死循环

while true              # 这里的true可以用":"来替换
do
    operation-1
    operation-2

    ..........
    # 需要一种手段从循环中跳出来，或者是让这个脚本挂起 
done

while :
do
    operation-1
    operation-2

    ..........
    # 需要一种手段从循环中跳出来，或者是让这个脚本挂起 
done
