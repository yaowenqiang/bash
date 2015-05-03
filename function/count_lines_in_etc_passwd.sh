#!/bin/bash - 
#===============================================================================
#
#          FILE: count_lines_in_etc_passwd.sh
# 
#         USAGE: ./count_lines_in_etc_passwd.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 15:48
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

count_lines_in_etc_passwd()
{
    [[ -r /etc/passwd ]] && REPLY=$(echo $(wc -l < /etc/passwd))
    # 如果/etc/passwd是可读的，那么就把REPLY设置为文件的行数。
    # 这样就可以同时返回参数值与状态信息。
    # ”echo" 看上去没什么用， 可是...
    # 它的作用是删除输出中的多余空白字符。
}
if count_lines_in_etc_passwd
then
    echo "There are $REPLY lines in /etc/passwd"
else
    echo "Cannot count lines in /etc/passwd."
fi
