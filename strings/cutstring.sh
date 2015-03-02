#!/bin/bash
# cutsubstring.sh

# $(string#substring)
# 从$string的开头位置截掉最短匹配的$substring

# $(string##substring)
# 从$string的开头位置截掉最长匹配的$substring

stringZ=abcABC123ABCabc

echo ${stringZ#a*C}         # 123ABCabc
echo ${stringZ##a*C}        # abc

