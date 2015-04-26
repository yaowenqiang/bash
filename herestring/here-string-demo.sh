#!/bin/bash - 
#===============================================================================
#
#          FILE: here-string-demo.sh
# 
#         USAGE: ./here-string-demo.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 17:41
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

String="This is a string of words."
read -r -a Words <<<"$String"
# "read"命令的-a选项,
# 将会把结果值按顺序的分配给数组中的每一项,

echo "First word in String is  ${Words[0]}"
echo "Second word in String is  ${Words[1]}"
echo "Third word in String is  ${Words[2]}"
echo "Fourth  word in String is  ${Words[3]}"
echo "Fifth word in String is  ${Words[4]}"
echo "Sixth word in String is  ${Words[5]}"
echo "Seventh word in String is  ${Words[6]}"
exit 0
