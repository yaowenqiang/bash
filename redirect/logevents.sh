#!/bin/bash - 
#===============================================================================
#
#          FILE: logevents.sh
# 
#         USAGE: ./logevents.sh 
# 
#   DESCRIPTION: 把事件记录在一个文件中.
#                必须以root身份运行(这样才有权限访问/var/log)
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 04/18/2015 23:17
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
ROOT_UID=0      # 只有$UID值为0的用户才具有root权限
E_NOTROOT=67    # 非root用户的退出错误

if [ "$UID" -ne "$UID" ]; then
    echo "Must be root to run this script."
    exit $E_NOTROOT
fi

FD_DEBUG1=3
FD_DEBUG2=4
FD_DEBUG3=5
# 去掉下边两地注释中的一行，来激活脚本.
# LOG_EVENTS=1
# LOG_VARS=1
log()       # 把时间和日期写入日志文件
{
    echo "$(date) $*" >&7   # 这会把日期*附加*到文件中.
                            # 参考下边的代码。
}

case $LOG_VARS


