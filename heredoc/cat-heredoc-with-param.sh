#!/bin/bash - 
#===============================================================================
#
#          FILE: cat-heredoc-with-param.sh
# 
#         USAGE: ./cat-heredoc-with-param.sh 
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

# 一个使用'cat'命令的here document,使用了参数替换.
# 不传命令行参数给它    ./scriptname
# 传一个命令行参数给它    ./scriptname Mortimer
# 传一个包含2个单词(用绰号括起来)的命令参数给它，
# ./scriptname "Mortimer Jones"

CMDLINEPARAM=1 # 所期望的最少的命令行参数个数。

if [[ $# -ge $CMDLINEPARAM ]]; then
    NAME=$1
else
    NAME="John Doe"
fi

RESPONDENT="the author of this fine script"
cat <<Endofmessage
Hello,there,$NAME,
Greeting to you,$NAME,from $RESPONDENT,
# This comment shows up the the output(why?).
Endofmessage

# 注意上边的空行也打印输出，
# 而上边的那行"注释"当然也会打印输出，
exit 0
