#!/bin/bash - 
#===============================================================================
#
#          FILE: script-array.sh
# 
#         USAGE: ./script-array.sh 
# 
#   DESCRIPTION: 将脚本的内容赋值给数组
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-05- 8 23:42
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

script_contents=( $(cat "$0" ))              # 将这个脚本的内容($0)
                                             # 赋值给数组
                                             # ${#script_contents[@]}
                                             # 表示数组元素的个数。
                                             # 一个小问题:
                                             # 为什么必须使用seq 0?
                                             # 用seq 1 试一下
                                             # TODO
for element in $(seq 0 $((${#script_contents[@]} -1))) ; do
    echo -n "${script_contents[$element]}"
                                             # 在同一行上显示脚本中每个载的内容。
                                             # 使用'---'作为域分隔符。
    echo -n "---"
done
echo
exit 0
# 练习:
# 修改这个脚本，
# 让这个脚本能够按照它原本的格式输出。
# 连同空白，换行，等等.
# TODO
