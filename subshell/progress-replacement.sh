#!/bin/bash - 
#===============================================================================
#
#          FILE: progress-replacement.sh
# 
#         USAGE: ./progress-replacement.sh 
# 
#   DESCRIPTION: 进程间替换的一些用法和技巧。
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/01 20:45
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

cat <(ls -l)
# 等价于    ls -l | cat 
sort -k 9 <(ls -l /bin) <(ls -l /usr/bin) <(ls -l /usr/X11R6/bin)
# 列出3个主要'bin‘目录中的所有文件，并且按文件名进行排序。
# 注意是3个(杳一下，上面就3个圆括号)明显不同的命令输出传递给'sort
diff <(command1) <(command2) # 给出两个命令输出的不同之处
# TODO 没看懂
tar cf <(bzip2 -c > file.tar.bz2) $directory_name
# 调用'tar cf /dev/fd/?? $directory_name',和'bzip2 -c > file.tar.bz2'
# 因为/dev/fd/<n>的系统属性，
# 所以两个命令之前的管道不必被命名，
# 
# 这种效果可以被模拟出来。
#
bzip2 -c < pipe >file.tar.bz2&
tar cf pip $directory_name
rm pip
#   或
# TODO
exec 3>&1
tar cf /dev/fd/4 $directory_name 4>&1 3>&- | bzip2 -c >file.tar.gz2 3>&-
exec 3>&-

