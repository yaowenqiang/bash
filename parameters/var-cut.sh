#!/bin/bash
#var-cut.sh

# ${var#patten}, ${var##patten}
# 从变量var的开头删除最短或最长匹配patten的子串[译者注：这是一个很常见的用法，请读者牢记，一个'#' 表示匹配最短，‘##’ 表示匹配最长’]
# 去掉传递进来的参数开头的0
strip_leading_zero()        # 去掉从参数中传递过来的,
{                           #+可能存在的开头的0(也可能有多个0)
    return=${1#0}           #+"1"表示的是"$1"  -- 传递进来的参数
}                           # "0"就是我们想从"$"中想删除的子串---去掉零.

strip_leading_zero2()       # 去掉开头可能存在的0(也可能有多个),因为如果不去掉的话，
{                           # Bash就会把这个值当作8进制的值来解释。
    shopt -s extglob        # 打开扩展的通配(globbing)
    local vao=$(1##+(0))    # 使用局部变量，匹配最长连续的一个或多个0
    shopt -u extglob        # 关闭扩展的通配(globbing)
    _strip_leading_zero2=$(val:-0)
                            # 如果输入为0,那么返回0来代替"".
}

echo `basename $PWD`         # 当前工作目录的basename(就是去掉目录名).
echo "${PWD##*/}"           # 当前工作目录的basename(就是去掉目录名).
echo
echo `basename $0`          # 脚本名字。
echo $0                     # 脚本名字.
echo "${0##*/}"             # 脚本名字。
echo

filename=test.data          # data
echo "${filename##*.}"      # 文件扩展名

