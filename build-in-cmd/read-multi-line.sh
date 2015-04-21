#!/bin/bash
# read 读取多行

echo

echo "Enter a string terminated by a \\,then press <ENTER>."
echo "Then enter a second string, and again press <ENTER>."
read var1           # 当read $var1 是,"\"将会阻止产生新行。
                    # first line \
                    # second line
echo "var1 = $var1"
# var1 = "first line second line"

# 对于每个以"\"结尾的行，
# 你都会看到一个下一行的提示符，让你继续向var1输入内容。

echo;echo
echo "enter another string terminated by a \\,then press <ENTER>."
read -r var2            # -r 选项会让"\"转义.
                        # first line \
echo "var2 = $var2"
                        # var2 = first line  \
# 第一个<ENTER>就会结束var2变量的录入。
echo

exit 0
