#!/bin/bash
# 第一个rot13脚本
# 使用'eval'的一个'rol13'的版本(译者：rol13就是把26个字母，从中间分为两半，各13个)
# 与脚本'rot13.sh'比较一下。

setvar_rot_13()         # 'rot13'函数
{
    local varname=$1 varvalue=$2
    eval $varname='$(echo "$varvalue" | tr a-z n-za-m)'
}

setvar_rot_13 var "foobar"          # 将"foobar"传递到rot13函数中，
echo $var
exit 0
