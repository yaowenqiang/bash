#!/bin/bash - 
#===============================================================================
#
#          FILE: unalias.sh
# 
#         USAGE: ./unalias.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/05 00:49
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

shopt -s expand_aliases

alias llm='ls -al | more'
llm

echo
unalias llm         # 删除别名
llm
# 产生错误信息，因为'llm‘已经不再有效了。
exit 0
