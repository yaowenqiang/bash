#!/bin/bash
# 结束ppp进程来强制登出log-off.

# 本脚本应该以root用户的身份来运行。
# TODO 这个脚本暂时还没看懂什么意思
killppp='eval kill -9 `ps ax | awk '/ppp/ { print $1}'`'
#               -------------- ppp的进程ID --------------
$killppp                        # 这个变量现在成为了一个命令

# 下边的命令必须以root用户的身份来运行。
chmod 666 /dev/ttys3                # 恢复读写权限，否则什么？TODO
# 我们把权限恢复到之前的状态，

rm /var/lock LCK...tty53            # 删除串锁文件，为什么?TODO

exit 0

# 练习：
# 1) 编写一个脚本来验证是否root用户正在运行它。
# 2) 做一个检查，在杀掉某个进程之前，
#    检查一下这个将要被杀掉的进程是否正在运行。
# 3) 基于'fuser'来编写达到这个目的的另一个版本的脚本
#    if [ fuser -s /dev/modem ];then...
