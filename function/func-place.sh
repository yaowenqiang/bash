#!/bin/bash - 
#===============================================================================
#
#          FILE: func-place.sh
# 
#         USAGE: ./func-place.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/01 22:06
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# 函数声明可以出现在看上去不可能出现的地方，比如说本应该出现命令的地方，也可以出现函数声明。，
ls -l | foo(){ echo "foo" } # 可以这么做， 但没什么用。
if [ "$USER" = bozo ] 
then
    bozo_greet () # 在if/then结构中定义函数。
    {
        echo "Hello,Bozo."
    }
fi
bozo_greet   # 只能由Bozo运行，其他用户使用的话

# 在某些上下文中，这样做可能会有用。
NO_EXIT=1   # 将会打开下面的函数定义。
[[ $NO_EXIT -eq 1 ]] && exit(){ true;} # 在'与列表'中定义函数。
# 如果$NO_EXIT为1,将会禁用内建的'exit'命令
exit # 这里调用的是"exit ()" 函数 ，而不是内建的"exit的命令.

