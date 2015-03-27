#!/bin/bash
# scrip 'set-test'

# 使用3个命令参数来调用 这个脚本。
# 比如，"./set.sh one two three".

echo
echo "Positional parameters before set \`uname -a\` :"
echo "Command-line argument #1= $1"
echo "Command-line argument #2= $2"
echo "Command-line argument #3= $3"

set `uname -a`          # 把`uname -a` 的命令输出设置
                        # 为新的位置参数。
echo $_                 # unknown(译者注：这要看你的uname -a 输出了，这句打印出的就是输出的最后一个单词。)

echo "Positional parameters after \` uname -a \` :"
# $1,$2,$3,等等，这些位置参数将被重新初始化为`uname -a`的结果。

echo "Field #1 of `uname -a`= $1"
echo "Field #1 of `uname -a`= $2"
echo "Field #1 of `uname -a`= $3"

echo ---
echo $_             ---
exit 0


