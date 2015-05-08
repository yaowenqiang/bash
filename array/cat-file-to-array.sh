#!/bin/bash - 
#===============================================================================
#
#          FILE: cat-file-to-array.sh
# 
#         USAGE: ./cat-file-to-array.sh 
# 
#   DESCRIPTION: 将一个文本文件的内容加载到数组.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/09 01:24
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

filename=sample_file
#           cat  sample_file
#
#           1 a b c
#           2 d e fg
declare -a array1
array1=( `cat $filename` )
#           List file co stdout     # 将filenae的内容
#                                   加载到数组array1

# array1=( `cat $filename| tr "\n" ' '` )
# 氢文件中的换行替换为空格
# 其实这么做是没必要的，Not necessary because bash does word splitting ,
# 因为Bash在做单词分隔(word splitting)的时候，将会把换行替换为空格。

echo ${array1[@]}       # 打印数组。
                        # 1 a b c 2 d a fg
#
# 文件中每个被空白分隔的 ‘单词',
# 都被保存到数组的一个元素中。
# 
element_count=${#array1[*]}
echo $element_count        # 8
