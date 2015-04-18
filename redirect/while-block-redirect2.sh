#!/bin/bash - 
#===============================================================================
#
#          FILE: while-block-redirect2.sh
# 
#         USAGE: ./while-block-redirect2.sh 
# 
#   DESCRIPTION: 重定向while循环的另一种形式。
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-18 16:23
#      REVISION:  ---
#===============================================================================

# set -o nounset                              # Treat unset variables as an error

# 为了避免重定向循环运行在子shell中（老版本的shell会这么做）,最好让重定向循环运行在当前工作区内。
# 这样的话，需要提前进行文件描述符重定向。
# 因为变量如果在(子shell上运行的)循环中被修改的话，循环结束后并不会保存修改后的值。

if [[ -z "$1" ]]; then
    Filename=names.data                     # 如果没有指定文件名，则使用这个默认值。
else
    Filename=$1
fi
echo 3>&0                                   # 将stdin保存到文件描述符3.
exec 0<"$Filename"

count=0
echo
while [ "$name" != Smith ] ; do
    read name                               # 从文件$Filename中循环读取
    echo $name
    let "count += 1"
done                                        # 从文件$Filename中循环读取
                                            # 因为文件有20行.
# 这个脚本碑在'while'循环的结尾还有一句:
# done <"$Filename"
# 练习：
# 为佬不需要这行了?
