#!/bin/bash - 
#===============================================================================
#
#          FILE: ref-params.sh
# 
#         USAGE: ./ref-params.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 15:16
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

# 解除传递给函数的参数引用.
# (复杂的例子)
ITERATIONS=3        # 取得输入的次数
icount=1
my_read () {
    # 用my_read varname 这种形式来调用。
    # 将之前用括号括起的值作为默认值输出。
    # 然后要求输入一个新值。 
    local local_var
    echo -n "Enter a value."
    eval 'echo -n "[$'$1']"  # 之前的值'
    # eval echo -n "[\$$1] " 更容易理解
    # 但会丢失用户在尾部输入的空格。
                            
    read local_var
    [ -n "$local_var" ] && eval $1=\$local_var
    # "与列表",如果"local_var"的测试结果为true,则把变量"$1" 的值赋给它。

}
echo
while [ "$icount" -le "$ITERATIONS" ]
do
    my_read var
    echo "Entry #$icount = $var "
    let "icount += 1"
    echo
done

exit 0
# TODO 还没看很懂.
