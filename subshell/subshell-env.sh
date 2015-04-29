#!/bin/bash - 
#===============================================================================
#
#          FILE: subshell-env.sh
# 
#         USAGE: ./subshell-env.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/30 00:28
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# 子shell可用于 为一组命令设置一个“独立的临时环境”
COMMAND1
COMMAND2
COMMAND3
{
    IFS=:
    PATH=/bin
    unset TERMINFO
    set -C
    shift 5
    COMMAND4
    COMMAND5
    exit 3 # 只是从子shell中退出.
}
COMMAND6
COMMAND7
exit 0
