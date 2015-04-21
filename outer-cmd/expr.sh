#!/bin/bash
# expr 使用

# 展示一些使用'expr'的例子。
# ==============================
echo
# 算述操作
# ---- ----
echo "Arithmetric Operators"
echo
a=`expr $a + 1`
echo
echo "a + 1 = $a"
echo "{incrementing a variable}"

a=`expr 5 % 3`

# 取模操作。
echo
echo "5 mod 3 = $a"
echo
echo
# 逻辑操作
# ---- ----
# true返回1，false返回0,
# 而Bash的使用管理则相反。

echo "Logical Operators"
echo
x=24
y=25
b=`expr $x = $y`            # 测试相等。
echo "b = $b "              # 0 ($x -ne $y)

a=3
b=`expr $a \> 10`
echo 'b=`expr $a \> 10`,therefore...'
echo "if a > 10,b = 0 (false)"
echo "b = $b"               # 0 (3 ! -gt 10)
echo
b=`expr $a \< 10`
echo "if a <= 10,b = 1(true)"
echo "b = $b"               # 1 (3 -lt 10)
echo
# 注意转义操作.

b=`expr $a \<= 3`
echo "if a <=3,b = 1(true)"
echo "b = $b"               # 1 ( e -le 3)
# 也有"\>="操作(大于等于).

echo
echo
# 字符串 操作
# ---- ----

echo "String Operators"
echo

a=1234zipper43231
echo "The string being operated upon is \"$a\". "

# 长度:字符串长度
b=`expr length $a`
echo "Length of \"$a\" is $b."
# 索引：从字符串的葬送查找匹配的子串。
b=`expr index $a 23`
echo "Numerical position of first \"2\" in \"$a\" is \"$b\""

# substr:从指定位置提取指定长度的字串。
b=`expr substr $a 2 6`
echo "Substring of \"$a\",starting at position 2,\
    and 6 chars long is \"$b\"."

# "match" 操作的默认行为就是从字符串的开始进行搜索。
# 并匹配第一个匹配的字符串。
#
# 使用正则表达式。
b=`expr match "$a" '(0-9)*'`
echo "Number of digits at the beginning of \"$a\" is $b."

b=`expr match "$a" '\([0-9]*\)'`            # 注意：需要转义符号。
                                            # 这样才能触发子串的匹配。
echo "The digits at the beginning of \"$a\" are \"$b\"."
echo
exit 0
# TODO 字符串匹配的不是很熟悉

