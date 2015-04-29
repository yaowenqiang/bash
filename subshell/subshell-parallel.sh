#!/bin/bash - 
#===============================================================================
#
#          FILE: subshell-parallel.sh
# 
#         USAGE: ./subshell-parallel.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/30 01:13
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# 在子shell中进行并行处理。
(cat list1 list2 list3 | sort | uniq > list123) & 
(cat list4 list5 list6 | sort | uniq > list456)
# 列表的合并与排序同时进行。
# 放到后台运行可以确保能够并行执行。
# 
# 等效于:
# cat list1 list2 list3 | sort | uniq > list123 & 
# cat list4 list5 list6 | sort | uniq > list456
wait # 不再执行下面的命令，走到子shell执行完毕 。
diff list123 list456
exit 0
