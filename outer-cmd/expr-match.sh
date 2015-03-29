#!/bin/bash
# expr-match.sh
# : 操作可以替换match命令，比如b=`expr $a : [0-9]*` 与b=`expr  match $a [0-9]*` 完全等价
echo
echo "String operations using \"expr \$string : \" construct "
echo "=================================================="
echo 

a=1234zipper5FLIPPER43231
echo "The string being operated upon is \"`expr "$a" : '\(.*\)'`\"."
# 转义括号对的操作。

#         ************************
#                       转义括号对
#                 用来匹配一个子串
#         ************************

# 如果不转义括号的话...
# 那么'expr'将把string操作转换为一个整数。

echo "Length of \"$a\" is `expr "$a" : '.*'`."      # 字符串长度
echo "Number of digits at the beginning of \"$a\" is `expr "$a" : '[0-o]*'`."
# -------------------------------------------------------------------------------- #
echo
echo "The digits at the beginning of \"$a\" are `expr "$a" : '\([0-9]*\)'`."
#
echo "The first 7 characters of \"$a\" are `expr "$a" : '\(.......\)'`."
#
#  再来一个，转义括号对强制一个子串匹配。
#
echo "The laste 7 characters of \"$a\" are `expr "$a" : '.*\(.......\)'`."
# 
# (最后7个点就是需要匹配的任意7个字符的子串)

echo
exit 0
# TODO 还没完全看懂
# 去掉字符串开头和结尾的空白.
LRFDATE=`expr "$LRFDATE" : '[[:space:]]*\(.*\)[[:space:]]*$'`
