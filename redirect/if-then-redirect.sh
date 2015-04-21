#!/bin/bash - 
#===============================================================================
#
#          FILE: if-then-redirect.sh
# 
#         USAGE: ./if-then-redirect.sh 
# 
#   DESCRIPTION: 重定向if/then测试结构
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-18 20:21
#      REVISION:  ---
#===============================================================================

# set -o nounset                              # Treat unset variables as an error

if [[ -z "$1" ]]; then
    Filename=names.data
else
    Filename=$1
fi

TRUE=1
if [[ "$TRUE" ]]; then              # if true 和if : 都可以
    read name
    echo $name
fi < "$Filename"
# 只读取了文件的一行，
# as "if/then"测试结构不能自动地反复地执行，除非把它们放到循环里。”
exit 0
