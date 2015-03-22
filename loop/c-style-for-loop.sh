#!/bin/bash
# c-style-for-loop.sh       # c语言风格的for循环

echo

# 标准语法，

for a in 1 2 3 4 5 6 7 8 9 10
do
    echo -n "$a "
done

echo; echo

# ========================================

# 现在，让我们用c风格语法来做相同的事情。

LIMIT=10
for ((a=1;a<=LIMIT;a++))    # 双圆括号，并且"LIMIT"变量前面没有"$".
do
    echo -n "$a "
done                        # 这是一个借用'ksh93'的结构

echo; echo

# ================================================================================
# 上我们使用c语言的"逗号操作符",来同时增加两个变量的值，
for (( a=1,b=1;a<=LIMIT;a++,b++))            # 逗号将同时进行两条操作。
do
    echo -n "$a-$b "
done
echo;echo
exit 0
