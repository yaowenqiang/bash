#!/bin/bash - 
#===============================================================================
#
#          FILE: subshell-var-check.sh
# 
#         USAGE: ./subshell-var-check.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/30 00:36
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# 子shell的另一个应用，是可以用来检测一个亦是是否定义
if (set -u;: $variable) 2> /dev/null
then
    echo "Variable is set. "
fi # 变量已经在当前脚本中被设置，
   # 或者是一个Bash的内建亦是。 
   # 或者是在当前环境下的一个可见变量(指已经被export的环境变量)
   # 也可以写成： [[ $variable-x != x || ${variable-x} != y ]]
   # 或： [[ ${variable-x} != x$variable ]]
   # 或： [[ ${variable-x} = x ]]
   # 或： [[ ${variable-x} != x ]]
   # TODO
exit 0
