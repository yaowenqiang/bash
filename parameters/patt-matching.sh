#!/bin/bash
# patt-matching.sh
# 使用# ## % %% 来进行参数替换操作的模式匹配，parameter substitution operators.

var1=abcd12345abc6789
pattern1=a*c          # *(通配符)匹配a ~ c 之间的任意字符。

echo

echo "var1 = $var1"     # abcd12345abc6789
echo "var1 = ${var1}"   # abcd12345abc6789
                        # 另一种形式
echo "Number of characters in ${var1} = ${#var1}"
