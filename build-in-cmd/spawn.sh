#!/bin/bash
# spawon.sh         一个fork出多个自身实例的脚本

PIDS=$(pidof sh $0)     # 这个脚本不同实例的进程ID
P_array=( $PIDS )       # 把它们放到数组里(为什么? TODO ).
echo $PIDS              # 显示父进程和子进程的进程ID.
let "instances = ${#P_array[*]} -1" # 计算元素个数，至少 为1，
                                    # 为什么减1?TODO
echo "$instances instances[s] of this script running."
echo "[Hit Ctrl-C to exit.].";echo

sleep 1     # 等一下.
sh $0       # 再来一次，Sam.
exit 0

# 在使用Ctrl+C退出之后，
# 是否所有产生出来的进程都会被kill掉？TODO
# 如果这样的话，为什么?

# 注意：
# ------
# 小心，不要让这个脚本运行太长时间，
# 它只会吃掉你绝大多数的系统资源。
# 
# 是否有合适的脚本技术，
# 用于产生脚本自身的大量实例，
# 为什么或为什么不？
