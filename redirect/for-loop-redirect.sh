#!/bin/bash - 
#===============================================================================
#
#          FILE: for-loop-redirect.sh
# 
#         USAGE: ./for-loop-redirect.sh 
# 
#   DESCRIPTION: 重定向for循环
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-18 19:49
#      REVISION:  ---
#===============================================================================

# set -o nounset                              # Treat unset variables as an error

if [[ -z "$1" ]]; then
    Filename=names.data
else
    Filename=$1
fi
line_count=`wc $Filename | awk '{print $1}'`
#                       目标文件的行数。
# 此处的代码太过做作，并且写得难看，
# 但至少展示了'for'循环的stdin可以重定向.
# 当然，你得足够聪明，才能看处出来。
#
# 更简洁的语句是 line_count=$(wc -l < "$Filename")
for name in `seq $line_count` ; do
    echo $name
    echo $name
    if [[ "$name" = Smith ]]; then
        break
    fi
done < "$Filename"
exit 0
