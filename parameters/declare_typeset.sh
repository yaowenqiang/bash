#!/bin/bash
# declare_typeset.sh
# declare 或者typeof内建命令(这两个命令是完全一样的)允许指定变量的具体类型，,在某些编程语言中，这是指定变量类型的一种很弱的方式
# declare/typeof 选项:
# -r 只读
#       declare -r var1
#       (declare -r var1 与 readonly var1 是完全一样的)

# -i 整形
declare -i number
# 脚本将会把变量"number"按照整形进行处理。
number=3
echo "number = $number"     # Number = 3

