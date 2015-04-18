#!/bin/bash - 
#===============================================================================
#
#          FILE: until-redirect.sh
# 
#         USAGE: ./until-redirect.sh 
# 
#   DESCRIPTION: util 循环重定向
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-18 16:39
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

if [[ -z "$1" ]]; then
    Filename=names.data                     # 如果没有指定文件名，则使用这个默认值。
else
    Filename=$1
fi

# while [ "$name" != Smith ] ; do            
until [ "$name" = Smith ] ; do               # 把!=改为=
    read name                                # 从Filename文件中读入，而不在stdin中读取
    echo $name
done < "$Filename"                           # 重定向stdin到文件$Filename
#       ---------
# 结果跟前面例子的'while'相同。
exit 0

