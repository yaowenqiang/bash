#!/bin/bash - 
#===============================================================================
#
#          FILE: dereference.sh
# 
#         USAGE: ./dereference.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 10:46
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# 对一个传递给函数的参数进行解除引用的操作
dereference ()
{
    y=\$"$1"        # 变量名
    echo $y         # Junk
    x=`eval "expr \"$y\" "`
    echo $1=$x
    eval "$1=\"Some Different Text\""    # 赋新值。
}

Junk="Some Text"
echo $Junk "Before"         # Some Text Before.
dereference Junk
echo $Junk "after"          # Some Different Text after.
exit 0
