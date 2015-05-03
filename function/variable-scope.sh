#!/bin/bash - 
#===============================================================================
#
#          FILE: variable-scope.sh
# 
#         USAGE: ./variable-scope.sh 
# 
#   DESCRIPTION: 函数内部的局部变量与全局变量.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 22:30
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

func ()
{
    local loc_var=23        # 声明为局部变量。
    echo                    # 使用"local" 内建命令
    echo "\"local_var\" in function = $loc_var"
    global_var=999          # 没有声明为局部变量
    echo "\"global_var\" in function = $global_var"
}
func


# 现在，来看年局部变量“loc_var"在函数外部是否可见
echo
echo "\"loc_var\" outside function = $loc_var"                                              # $loc_var outside function = 
                         # 不行，$loc_var不是全局可见的.
echo "\"global_var\" outside function = $global_var"                                        # $global_var outside function =999
echo
exit 0

# 与C语言相比，在函数内声明的Bash变量，
# 除非它被明确声明为local时，它才是局部的。

