#!/bin/bash
# cutsubstring.sh

# $(string#substring)
# 从$string的开头位置截掉最短匹配的$substring

# $(string##substring)
# 从$string的开头位置截掉最长匹配的$substring

stringZ=abcABC123ABCabc

echo ${stringZ#a*C}         # 123ABCabc
echo ${stringZ##a*C}        # abc

# ${string%substring}
# 从$string的结尾位置截掉最短匹配的$substring

# ${string%%substring}
# 从$string的结尾位置截掉最长匹配的$substring

stringZ=abcABC123ABCabc

echo ${stringZ%b*c}         # abcABC123ABCa
# 从$stringz的结尾处截掉'b'到'c'之间最短的匹配。
echo ${stringZ%%b*c}        # a
# 从$stringz的结尾处截掉'b'到'c'之间最长的匹配。
