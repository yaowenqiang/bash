#!/bin/bash - 
#===============================================================================
#
#          FILE: while-block-redirect.sh
# 
#         USAGE: ./while-block-redirect.sh 
# 
#   DESCRIPTION: while block 循环的重定向
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-18 16:00
#      REVISION:  ---
#===============================================================================

# set -o nounset                              # Treat unset variables as an error

if [[ -z "$1" ]]; then
    Filename=names.data                     # 如果没有指定文件名，则使用这个默认值。
else
    Filename=$1
fi
# Filename=${1:-names.data}
# 这句话可以代替上面的测试(参数替换).

count=0
echo
while [ "$name" != Smith ] ; do            # 为什么变量$name要用引号?
    read name                               # 从Filename文件中读入，而不在stdin中读取
    let "count += 1"
done < "$Filename"                           # 重定向stdin到文件$Filename.
#
echo;echo "$count names read" ;echo
exit 0

# 注意在一些比较老的shell脚本编程语言中，
# 重定向的循环是入在子shell里运行的，　
# 因此，$count值返回后会是0,此值　是在循环开始前的初始值，
# *如果有可能的话*,尽量避免在Bash或ksh中使用子shell.
# 所以这个脚本能够正确的运行。

# 然而...
# Bash有时还是*会*在一个使用管道的'while-read'循环中启动一个子shell.
# 与重定向的'while'循环还是有区别的。
# TODO 还没看
abc=hi
echo -e "1\n2\n3" | while read 1
do
    echo abc="$1"
    echo
done
echo $abc


