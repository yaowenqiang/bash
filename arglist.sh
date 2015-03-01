#!/bin/bash
# arglist.sh
# 多使用几个参数来调用这个脚本，比如"one tow three".

E_BADARGS=65
if [ ! -n "$1" ]
then
    echo "Usage: `basename $0` argument1 argument2 argument3 etc."
fi

echo
index=1         # 起始计数

echo "listing args with \"\$*\""
for arg  in "$*" ; do       # 如果 "$*" 不被"" 引用，那么将不能正常地工作。
    echo "Arg #$index = $arg"
    let "index+=1"
done            # $* 将所有的参数看成一个单词

echo "Entire arg list seen as single word."

echo 

index=1
echo "listing args with \"\$@\":"
for arg in "$@"
do
    echo "Arg #$index = $arg"
    let "index+=1"
done                # $@ 把每个参数都看成是单独的单词
echo "Entire arg list seen as separate words."

index=1
echo "listing args with \"\$*(unquoted)"
for arg in $* ; do
    echo "Arg #$index = $arg"
    let "index+=1"
done                # 末引用的$*将会把参数看成单独的单词。

echo "Entire arg list seen as separate words."
exit 0
