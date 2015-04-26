#!/bin/bash - 
#===============================================================================
#
#          FILE: commentblock-test.sh
# 
#         USAGE: ./commentblock-test.sh 
# 
#   DESCRIPTION:
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 15:38
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

: <<DEBUGXXX
echo 1
echo 2
echo 3
echo 4
DEBUGXXX
echo 5
exit 0

