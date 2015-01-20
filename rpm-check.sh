#!/bin/bash
# rpm-check.sh

# 这个脚本的目的是为了描述，列表，和确定是否可以安装一个rpm包
# 在一个文件中保存输出

# 这个脚本使用一个代码块来展示
SUCCESS=0
E_NOARGS=65
if [ -z "$1" ]
then
    echo "Usage `basename $0` rpm-file"
fi
{
    echo 
    echo "Archive Description:"
    rpm -qpi $1     #查询说明
    echo
    echo "Archive Listing:"
    rpm -qpl $1     #查询列表.
    rpm -i --test $1
    if [ "$?" -eq $SUCCESS ]
    then
        echo "$1 can be installed."
    else
        echo "$1 cannot be installed."
    fi
} > "$1.test"
echo "Results of rpm test in file $1.test"
