#!/bin/bash - 
#===============================================================================
#
#          FILE: ind-func.sh
# 
#         USAGE: ./ind-func.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 10:36
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# 将一个间接引用传递给函数。
echo_var()
{
    echo "$1"
}

message=Hello
Hello=Goodbye
echo_var "$message"     # Hello
# 现在，让我们传递一个间接引用给函数。
echo_var "${!message}"  # Goodbye
# TODO 要看一下间接引用是怎么用的
echo "----------"
# 如果我们改变“hello"变量的值会发生什么？
Hello="Hello,again!"
echo_var "$message"             # Hello
echo_var "${!message}"          # Hello,again!
exit 0
