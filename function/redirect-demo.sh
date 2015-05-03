#!/bin/bash - 
#===============================================================================
#
#          FILE: redirect-demo.sh
# 
#         USAGE: ./redirect-demo.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 22:02
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

Function ()
{
    ...
} < file
# 试试这个

Function ()
{
    {
        ...
    } < file
}
# 同样的

Function ()         # 没问题
{
    {
        echo $*
    } | tr a b
}

Function ()         # 不行
{
    echo $*
} | tr a b          # 这儿的内嵌代码块是被强制的。
