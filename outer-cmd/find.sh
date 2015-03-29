#!/bin/bash
# find 命令示例

find -exec COMMAND \;

find ~/ -name '*.txt'
# 如果COMMAND 中包含{},那么find命令将会用所有匹配文件的路径名来替换"{}" 
find ~/ -name 'cor*' -exec rm {} \;

find /home/boso/projects -mtime 1
# 列出最后一天被修改的
# mtime ＝目标文件最后修改的时间
# ctime = 修改后的最后状态(通过'chmod'或其他方法)
# atime = 最后访问时间

DIR=/home/boso/junk_files
find "$DIR" -type f -atime +5 -exec rm {} \;
# 删除至少3天内没被访问过的$DIR目录中的所有文件。
# -type filetype,where
# f = regular file
# d = directory,etc.

find /etc-exec grep '[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*'
# 在/etc目录的文件找到所有包含IP地址(xxx.xxx.xxx.xxx)的文件，
# 可能会查找一些多余的匹配，我们如何去掉它们呢？

# 或许可以使用如下方法：
find /etc -type f -exec cat '{}' \;| tr -c '.[:digit:]' '\n' | grep '^[^.][^.]*\.[^.][^.]*\.[^.][^.]*\.[^.][^.]*$'
#  [:digit:] 是一种字符类。
