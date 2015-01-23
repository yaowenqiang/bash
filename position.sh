#!/bin/bash
# 位置参数
# 作为用例，调用这个脚本至少需要10个参数，比如
# ./scriptname 1 2 3 4 5 6 7 8 9 10
MINPARAMS=10

echo

echo "The name of this script is \"$0\"."
# 添加./是表示当前目录
echo "The name of this script is \"`basename $0`\"."

if [ -n "$1" ]; then          # 测试变量被引用
    echo "Parameter #1 is $1" # 需要引用才能够黑底"#"
fi
if [ -n "$2" ]; then          # 测试变量被引用
    echo "Parameter #2 is $2" # 需要引用才能够黑底"#"
fi
if [ -n "$3" ]; then          # 测试变量被引用
    echo "Parameter #3 is $3" # 需要引用才能够黑底"#"
fi
if [ -n "$4" ]; then          # 测试变量被引用
    echo "Parameter #4 is $4" # 需要引用才能够黑底"#"
fi
if [ -n "$5" ]; then          # 测试变量被引用
    echo "Parameter #5 is $5" # 需要引用才能够黑底"#"
fi
if [ -n "$6" ]; then          # 测试变量被引用
    echo "Parameter #6 is $6" # 需要引用才能够黑底"#"
fi
if [ -n "$7" ]; then          # 测试变量被引用
    echo "Parameter #7 is $7" # 需要引用才能够黑底"#"
fi
if [ -n "$8" ]; then          # 测试变量被引用
    echo "Parameter #8 is $8" # 需要引用才能够黑底"#"
fi
if [ -n "$9" ]; then          # 测试变量被引用
    echo "Parameter #9 is $9" # 需要引用才能够黑底"#"
fi
if [ -n "${10}" ]; then       # 大于$9的参数必须用{}卑鄙起来
    echo "Parameter #1 is $1" # 需要引用才能够黑底"#"
fi

echo "-----------------------------------"
echo "All the command-lien Parameters are :"$*""

if [ $# -lt "$MINPARAMS" ]; then
    echo "This script need at least $MINPARAMS command-line arguments!"
fi
echo 
exit 

