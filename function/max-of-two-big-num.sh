#!/bin/bash - 
#===============================================================================
#
#          FILE: max-of-two-big-num.sh
# 
#         USAGE: ./max-of-two-big-num.sh 
# 
#   DESCRIPTION: 比较两个大整数
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 18:06
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

EQUAL=0             # 如果两个值相等，那就返回这个值
E_PARAM_ERR=-99999  # 没有足够多的参数传闻给函数，
                    # 任意超出范围的参数都可以传递进来。
max2()
{
    if [[ -z "$2" ]]; then
        echo $E_PARAM_ERR
        return
    fi
    if [[ "$1" -eq "$2" ]]; then
        echo $EQUAL
        return
    else
        if [[ "$1" -gt "$2" ]]; then
            retval=$1
        else
            retval=$2
        fi
    fi
    echo $retval        # 输出到stdout,而没有用返回值，为什么？TODO
}

return_val=$(max2 33001 33097)

# ====================OUTPUT====================
if [[ "$return_val" -eq "$E_PARAM_ERR" ]]; then
    echo "Error in parameters passed to comparison function !"
elif [ "$return_val" -eq "$EQUAL" ]
then
    echo "The tow numbers are equal."
else
    echo "The larger of the two numbers is $return_val"
fi
# ==============================================

exit 0
# 练习
# 1）找到一种更优雅的方法，
#    来测试传递给函数的参数
# 2) 简化"输出"段的if/then结构，
# 3) 重写这个脚本，使其能够从命令行参数中获得输入。
# TODO

