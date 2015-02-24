#!/bin/bash
# test_square_bracket.sh
 echo

 if test -z "$1"; then
     echo "No command-line arguments"
 else
     echo "First command-line argument is $1."
 fi

 echo

if /usr/bin/test -z "$1"; then          # 与内建的"test" 命令结果相同
     echo "No command-line arguments"
 else
     echo "First command-line argument is $1."
fi

echo

if  [ -z "$1" ]; then                   # 与上边的代码块作用相同
    # if [ -z "$1"                      # 应该能够运行，但是
    #+ Bash会报错，提示缺少关闭条件测试的右中括号。
     echo "No command-line arguments"
 else
     echo "First command-line argument is $1."
fi

echo


