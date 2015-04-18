#!/bin/bash - 
#===============================================================================
#
#          FILE: for-stdin-stdout.sh
# 
#         USAGE: ./for-stdin-stdout.sh 
# 
#   DESCRIPTION: 重定向for循环(stdin和stdout都进行重定向)
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-18 20:07
#      REVISION:  ---
#===============================================================================

# set -o nounset                              # Treat unset variables as an error

if [[ -z "$1" ]]; then
    Filename=names.data
else
    Filename=$1
fi
Savefile=$Filename.new
FinalName=Jonsh                             # 终止'read'的名称。
line_count=`wc $Filename | awk '{print $1}'`
for name in `seq $line_count` ; do
    read name
    echo "$name"
    if [[ "$name" = "$FinalName" ]]; then
        break
    fi
done < "$Filename" > "$Savefile"            # 重定向stdin到文件$Filename
                                            # 并且将它保存到报告文件中。
exit 0
