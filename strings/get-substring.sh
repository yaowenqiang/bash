#!/bin/bash
# get-substring.sh

# ${string:position}
# 在$string中从位置position开始提取子串
# 如果$string是'*'或者'@',那么将会提取从位置$position开始的位置参数

# ${string:position:length}
# 在$string中从位置$position开始提取$length长度的子串

stringZ=abcABC123ABCabc

#       0123456789...
#       0-based indexing.

echo ${stringZ:0}      # abcabc123abcabc
echo ${stringZ:1}      # bcabc123abcabc
echo ${stringZ:7}      # 23abcabc


echo ${stringZ:7:3}    # 23a
                       # 提取子串长度为3

# TODO
# 能不能从字符串的右边(也就是结尾)部分开始提取子串?


# TODO 这个地方没看懂
echo ${stringZ:-4}
# 默认是提取整个字符串，就像${parameter:-default}一样，，
# 然而...

echo ${stringZ:(-4)}        # Cabc
echo ${stringZ: -4}         # Cabc
# 这样，它就可以工作了.
# 使用圆括号或者添加一个空格可以"转义"这个位置参数。 

echo ${*:2}             # 打印出第2个和后边所有的位置参数。
echo ${@:2}             # 同上
echo ${*:2:3}           # 从第二个开始，连续打印3个位置参数

# expr substr $string $position $length
# 在$string中从$position开始提取$length长度的子串


stringZ=abcABC123ABCabc
#   123456789
#   从1开始计算。
echo `expr substr $stringZ 1 2`     # ab
echo `expr substr $stringZ 4 3`     # ABC

# expr match "$string".'\{$substring\}'
# 从$string的开始位置提取$substring,$substring是正则表达式
# expr "$string":'\{$substring\}'
# 同上

stringZ=abcABC123ABCabc
echo `expr match $stringZ '\(.[b-c]*[A-Z]..[0-9]\)'`
echo `expr $stringZ : '\(.[b-c]*[A-Z]..[0-9]\)'`
echo `expr $stringZ : '\(.......\)'`

# 上这的每个echo都打印出相同的结果。

# expr match "$string".'.*\($substring\)'
# 从$string的结尾提取$substring,$substring是正则表达式

# expr "$string":'.*\($substring\)'
# 从$string的结尾提取$substring,$substring是正则表达式

stringZ=abcABC123ABCabc
echo `expr match $stringZ  '.*\([A-C][A-C][A-C][a-c]*\)'`
echo `expr $stringZ : '.*\(......\)'`
