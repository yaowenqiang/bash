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

# TODO 这个地方没看懂，不是很明白
if /usr/bin/[ -z "$1" ]                 # 再来一个，与上边的代码作用相同
# if /usr/bin/[ -z "$1"                 # 能够工作，但是还是给出一个错误消息
#                                       # 注意:
#                                         在版本3.x的Bash中,这个bug已经被修正
then                                    
     echo "No command-line arguments"
 else
     echo "First command-line argument is $1."
fi

echo

file=/etc/passwd
if [[ -e $file ]]; then
    echo "Password file exists."
fi

dir=/home/bozo
if cd "$dir" 2>/dev/null;then       # 2>/dev/null会隐藏错误信息
    echo "Now in $dir."
else
    echo "Can't change to $dir."
fi
exit 0
