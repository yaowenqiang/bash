#!/bin/bash - 
#===============================================================================
#
#          FILE: return-big-number.sh
# 
#         USAGE: ./return-big-number.sh 
# 
#   DESCRIPTION: 获得大整数"返回值"
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 18:00
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

Return_val=     # 用于保存函数特大返回值的全局变量
alt_return_test ()
{
    fvar=$1
    Return_val=$fvar
    return          # 返回0(成功).
}
alt_return_test 1
echo $?             # 0
echo "return value =  $Return_val" # 1

alt_return_test 256
echo "return value =  $Return_val" # 256

alt_return_test 257
echo "return value =  $Return_val" # 257

alt_return_test 25701
echo "return value =  $Return_val" # 25701

exit 0


