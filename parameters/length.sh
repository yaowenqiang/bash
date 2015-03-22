#!/bin/bash
#length.sh

# 变量长度/子串删除

# ${#var}
# 字符串长度(变量$var中字符个数),对于array来说，${array}表示的是数组中的第一个元素的长度
# 例外情况:
# ${#*}和${#@}表示位置参数的个数，
# 对于数组来说，${array[*]} 和 ${array[*]} 表示的是数组中的第一个元素的长度

E_NO_ARGS=65

if [ $# -eq 0 ]
then
    echo "please invoke this script with one or more command-line arguments."
    exit $E_NO_ARGS
fi

var01=abcdEFGH28ij
echo "var01 = ${var01}"
echo "length of var01 = ${#var01}"
# 现在，让我们试试在变量中嵌入一个空格。
var02="abcd   EFGH28ij" # 加了空格以后长度会发生变化
echo "var02 = ${var02}"
echo "length of var02 = ${#var02}"

echo "Number of command-line arguments passwd to script = ${#@}"
echo "Number of command-line arguments passwd to script = ${#*}"
exit 0
