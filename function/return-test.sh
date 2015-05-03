#!/bin/bash - 
#===============================================================================
#
#          FILE: return-test.sh
# 
#         USAGE: ./return-test.sh 
# 
#   DESCRIPTION: 测试函数最大的返回值。
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 16:27
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

return_test ()      # 传给函数什么值， 就返回什么值。
{
    return $1
}
return_test  27     # ok.
echo $?             # 返回27

return_test  255     # ok.
echo $?              # 返回255

return_test  257     # 错误 
echo $?              # 返回255

# ==================================================

return_test -151896    # 能返回一个大负数吗？
echo $?                # 能够返回-151896
                       # 显然不行，只返回了168
# Bash2.05b以前的版本，
# 允许返回大负数。
# Bash的新版本(2.05b之后)修正了这个漏洞。
# 这可能会影响以前所编写的脚本。
# 一定好小心。
# ==================================================
exit 0

