#!/bin/bash

# tail.sh

filename=sys.log

cat /dev/null > $filename;echo "Createing/Cleaning out file."

# 如果文件不存在的话就创建文件。
# 然后将这个文件清空。
# :>filename 和> filename 也能完成这个功作。

tail  /var/log/messages > $filename             
# /var/log/messages 必须具有全局的可读授权才行。

echo "$filename contains tail end of system log."


var=$(head -$m $filename | tail -$n)

# filename = 文件名
# m = 从文件开关到块结尾的行数
# n = 想保存到变量中的指定行数(从块结尾开始截断)
exit 0

