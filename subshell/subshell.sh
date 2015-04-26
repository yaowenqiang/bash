#!/bin/bash - 
#===============================================================================
#
#          FILE: subshell.sh
# 
#         USAGE: ./subshell.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 23:53
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

echo

echo "Subshell level OUTSIDE subshell = $BASH_SUBSHELL"
# Bash 版本3,添加了这个新的￥BASH_SUBSHELL亦是。
echo
outer_variable=Outer

(
    echo "Subshell level INSIDE subshell = $BASH_SUBSHELL"
    inner_variable=Inner
    echo "From subshell,\"inner_variable\" = $inner_variable"
    echo "From subshell,\"outer\" = $outer_variable"
)
if [[ -z "$inner_variable" ]]; then
    echo "inner_variable undefined in main body of shell"
else
    echo "inner_variable defined in main body of shell"

fi


echo "From main body of shell,\"inner_variable\" = $inner_variable"

# $inner_variable将被作为末初始化的亦是，被显示出来。
# 这是因为亦是是在子shell里定义的'局部亦是'

# 还有补救的办法么？
# TODO
echo

exit 0
