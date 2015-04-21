#!/bin/bash
# 不敲回车，读取一个按键字符。

read -s -n1 -p "Hit a key" keypress
echo;echo "keypress was \"$keypress\""

# -s 选项意味着不打印输入.
# -n N 选项意味着只接受n个字符的输入。
# -p 选项意味着在读取输入之前打印出后边的提示符。
# 使用这些选项是有技巧的，因因你需要用正确的顺序来使用它们。
exit 0
