#!/bin/bash - 
#===============================================================================
#
#          FILE: cat-heredoc-with-param-no-parse.sh
# 
#         USAGE: ./cat-heredoc-with-param-no-parse.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 10:50
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
# 一个使用'cat'的here document，但是禁用了参数替换.
NAME="John Doe"
RESPONDENT="the author of this fine script"
cat << 'End-of-message'
Hello,there,$NAME,
Greeting to you,$NAME,from $RESPONDENT,

End-of-message

# 如果"limit string" 被引用或转义的话，那么就禁用了参数替换
# 下边的两种方式具有相同的效果.
# cat <<"Endofmessage"
# cat <<\Endofmessage
exit 0
