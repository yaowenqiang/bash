#!/bin/bash - 
#===============================================================================
#
#          FILE: reassign-stdout.sh
# 
#         USAGE: ./reassign-stdout.sh 
# 
#   DESCRIPTION: 使用exec来重定向stdout
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-18 15:12
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

LOGFILE=logfile.txt

exec 6>&1                                   # 将fd 6 与stdout链接起来。
exec > $LOGFILE                             # stdout就被文件"logfile.txt"所代替了。
# --------------------------------------------------------------------------------- #
# 在这块中所有命令的输出都会发送到文件$LOGFILE中。
echo -n "Logfile: "
date
echo "------------------------------------------"
echo
echo "Output of \"ls -al\" command"
echo
ls -al
echo;echo
echo "Output of \"df\" command"
echo
df
# --------------------------------------------------------------------------------- #
exec 1>&6 6>&-                              # 恢复stdout,然后关闭文件描述符#6.
echo
ls -al
echo
exit 0



