#!/bin/bash
# xargs-log.sh          使用xargs来监控系统log

# 从/var/log/messagesGenerates的发问开始
# 产生当前目录正反一个lof文件。
# 注意：如果这个脚本被一般用户调用的话，
# /var/log/messages 必须是全部可读的。
#  #root chmod 644 /var/log/messages

LINES=5

( date;uname -a ) >>logfile

# 时间和机器名

echo --------------------------------------------------------------------------------
tail -$LINES /var/log/messages | xargs | fmt -s >>logfile
echo >>logfile
echo >>logfile

exit 0

# 注意：
# -----
# 在原文件中的任何不匹配的括号(包括单引号和双引号)
# 都会给xargs造成麻烦
# 可以使用下面的这行替换上国的第17行。
# tail -$LINES /var/log/messages | tr -d "\"'" | xargs | fmt -s >>logfile

# 练习:
# -----
# 修改这个脚本，使用这个脚本每隔20分钟
# 就跟踪一下/var/log/messages的修改记录，
# 提示：使用"watch"命令
# TODO 
