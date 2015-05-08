#!/bin/bash - 
#===============================================================================
#
#          FILE: array-copy.sh
# 
#         USAGE: ./array-copy.sh 
# 
#   DESCRIPTION: 复制一个数组
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/09 00:48
#      REVISION:  ---
#===============================================================================

# set -o nounset                              # Treat unset variables as an error

array0=( "${array1[@]}" )
# 或
array0="${array1[@]}"
# 然而,如果在'缺项'数组中使用的话，将会失败.
# 也就是说数组中存在空洞(中间的某个元素没赋值)，

# ------------------------------
array1[0]=0
#   array1[1]=0     没赋值
array1[2]=2
array2=( "${array1[@]}" ) # 拷贝它?

echo ${array2[0]}         # 0
echo ${array2[2]}         # (null),应该是2

# 添加一个元素到数组。
array=( "$array[@]" "new element" )
# 或
array[${#array[*]}]="new element"
exit 0


