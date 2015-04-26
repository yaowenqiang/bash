#!/bin/bash - 
#===============================================================================
#
#          FILE: anonymous-here-doc.sh
# 
#         USAGE: ./anonymous-here-doc.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 14:45
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

: <<TESTVARIABLES
${HOSTNAME?}${USR?}${MAIL?}
TESTVARIABLES
# 如果其中某个变量没被设置，那么就打印错误信息.
exit 0
