#!/bin/bash - 
#===============================================================================
#
#          FILE: and-list-test-arg.sh
# 
#         USAGE: ./and-list-test-arg.sh 
# 
#   DESCRIPTION: 使用'与'列表来测试命令行参数的另一个例子.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/06 00:41
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

ARGS=1                  # 期望的参数个数
E_BADARGS=65            # 如果传递的参数个数不正常，那么给出这个退出码
test $# -ne $ARGS && echo "Usage: `basename $0` $ARGS  arguments(s)" && exit $E_BADARGS
# 如果'条件1'测试为true(表示传递给脚本的参数个数不对).
# 则余下的命令会被执行，并且脚本将结束运行。
# 只有当上面的测试条件为false.的时候，这行代码才会被执行.

echo "Correct number of agruments passed to this script."
exit 0
# 为了检查退出码，在脚本结束的时候可以使用'echo $?'来检查退出码。

