#!/bin/bash - 
#===============================================================================
#
#          FILE: month_length.sh
# 
#         USAGE: ./month_length.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 18:39
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

month_length()  # 把月份作为参数
{               # 返回譔月包含的天数。
    monthD="31 28 31 30 31 30 31 31 30 31 30 31"
    # 作为发问变量声明?
    echo "$monthD" | awk '{print $'"${1}"'}' # 小技巧，传递给函数的参数($1 -- 月份号),然后传递给awk,Awk把参数解释为"print $1...print $12"(这依赖于月份号)
    # TODO 没看懂
    # 这是一个模板，用于将参数传递给内嵌的awk的脚本:
    # $`"$(script_parameter)"`
    # 需要做一些错误检查，来保证月份号正确，在范围[1-12]之前.
    # 别忘了检查闰年的二月
}
# ----------------------------------------
# 用例:
month=5         # 以四月为例
days_in=$(month_length $month)
echo $days_in   # 30
# ----------------------------------------

