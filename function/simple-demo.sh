#!/bin/bash - 
#===============================================================================
#
#          FILE: simple-demo.sh
# 
#         USAGE: ./simple-demo.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/01 21:43
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

JUST_A_SECOND=1
funky()
{
    # 这是一个最简单的函数。 
    echo "This isa funky function."
    echo "Now exiting funky function."
    # 函数必须在调用前声明 。
}
fun ()
{
    # 一个稍微复杂一些的函数。
    i=0
    REPEATS=20
    echo
    echo "And now the fun really begins."
    echo
    sleep $JUST_A_SECOND # 嘿，暂停一秒!
    while [ $i -lt $REPEATS ]
    do
        echo "--------FUNCTIONS--------"
        echo "-----------ARE-----------"
        echo "-----------FUN-----------"
        echo
        let "i+=1"
    done
}
fun
funky
exit 0
