#!/bin/bash - 
#===============================================================================
#
#          FILE: func-with-arg.sh
# 
#         USAGE: ./func-with-arg.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/01 23:09
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

# 函数和参数
DEFAULT=default         # 默认参数值。
func2 () {
    if [[ -z "$1" ]]; then  # 第一个参数是否长度为零
        echo "-Parameter #1 is zero length."    # 第一个参数是否长度为零。
    else
        echo "-Param #1 is \"$1\"."
    fi
# TODO 
variable=${1-$DEFAULT}      # 这里的参数替换
echo "variable = $variable" # 表示什么？
                            # -------------------
if [ "$2" ]
then
    echo "-Parameter #2 is \"2\"."
fi
echo "-----------------"
return 0
}

echo
echo "Nothing passed."
func2                   # 不带参数调用 。
echo
echo "Zero-length parameter passed"
func2 ""        # 使用0长度的参数进行调用。
echo "Null parameter passed."
func2 "$uninitialized_param"    # 使用末初始化的参数 进行调用 。
echo "One parameter passed."
func2 first                     # 带一个参数的调用 。
echo "Two parameter passed."
func2 first two                     # 带二个参数的调用 。
echo "\"\" \"second\" passed."
func2 "" second                     # 带两个参数调用，第一个参数长度为0，第二个参数是由ASCII码组成的字符串。

