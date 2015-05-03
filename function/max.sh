#!/bin/bash - 
#===============================================================================
#
#          FILE: max.sh
# 
#         USAGE: ./max.sh 
# 
#   DESCRIPTION: 取两个整数中的最大值。
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 15:34
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

E_PARAM_ERR=-198    # 如果传递给函数的参数少于2个小时，就返回这个值。
EQUAL=-199          # 如果两个整数相等时，返回这个值。
# 任意超出范围的
# 参数值都可能传递到函数中。
max2()              # 返回两个参数中的最大值，
                    # 注意：参与比较的数必须小于257 
{
    if [[ -z "$2" ]]; then
        return $E_PARAM_ERR
    fi
    if [[ "$1" -eq "$2" ]]; then
        return $EQUAL
    else
        if [[ "$1" -gt "$2" ]]; then
            return $1
        else
            return $2
        fi
    fi
}
max2 33 34
return_val=$?
if [[ "$return_val" -eq $E_PARAM_ERR ]]; then
    echo "The tow numbers are equal."
else
    echo "The larger of the tow numbers is $return_val."
fi
exit 0

# 练习(简单)
# 把这个脚本转化为交互式脚本。
# 也就是，修改这个脚本，让其要求调用都输入2个数。
# TODO

