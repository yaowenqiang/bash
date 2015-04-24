#!/bin/bash - 
#===============================================================================
#
#          FILE: cat-heredoc.sh
# 
#         USAGE: ./cat-heredoc.sh 
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

# echo 对于打印单行消息来说是非常好用的，
# 但是在打印消息块的时候可能就有点问题了，
# "cat" here document 可以解决这个限制。
cat <<End-of-message
----------------------------------------
This is line 1 of the message.
This is line 2 of the message.
This is line 3 of the message.
This is line 4 of the message.
This is ths last line  of the message.
----------------------------------------
End-of-message

# 用下边这行代码代替上边的第7行，
# cat > $newfile <End-of-message
#       ----
# 那么就会把输出写到文件$newfile中，而不是stdout.
exit 0
# ----------------------------------------
# 下边的代码不会运行，因为上边有'exit 0'.
# 下边代码也能够达到相同目的。
echo "----------------------------------------
    This is line 1 of the message.
    This is line 2 of the message.
    This is line 3 of the message.
    This is line 4 of the message.
    This is ths last line  of the message.
----------------------------------------------"
# 然而，文本中可能不允许双引号，除非它们被转义。
