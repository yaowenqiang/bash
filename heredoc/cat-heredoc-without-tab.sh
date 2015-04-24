#!/bin/bash - 
#===============================================================================
#
#          FILE: cat-heredoc-without-tab.sh
# 
#         USAGE: ./cat-heredoc-without-tab.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-25 01:48
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# - 选项对于here document来说，
# <<-可以抑制文档休前边的tab,
# 而*不*是空格。
cat <<-ENDOFMESSAGE
	This is line 1 of the message.
	This is line 2 of the message.
	This is line 3 of the message.
	This is line 4 of the message.
	This is ths last line  of the message.
ENDOFMESSAGE
# 脚本在输出的时候左边将被刷掉，
# 就是说每行前边的Tab将不会显示.
# 上这5行"消息"的前边都是tab,而不是空格，
# 空格是不爱<<-影响的。
# 注意，这个选项对于*嵌在*中间的tab没作用。
exit 0
