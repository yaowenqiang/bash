#!/bin/bash - 
#===============================================================================
#
#          FILE: subshell-lock-check.sh
# 
#         USAGE: ./subshell-lock-check.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/30 01:05
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# 子shell还可以用来检测一个加锁的文件 .
if (set -C;: > lock_file) 2> /dev/null
then
    : # lock_file不存在，还没有用户运行这个脚本.
else
    echo "Another user is already running that script."
    exit 65
fi

