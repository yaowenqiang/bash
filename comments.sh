#!/bin/sh
# This line is a comment.
# echo "A comment will follow." #注释在这里
#                               注意#前边的空白
    #   A tab precedes this comment.
echo "The # here does not begin a comment."
echo 'The # here does not begin a comment.'
echo 'The # here does not begin a comment.'
echo The \# here does not begin a comment.
echo The # 这里开始一个注释。
echo ${PATH#*:}         #参数转换,不是一个注释
echo $(( 2#101001 ))    #数制转换,不是一个注释
# 感谢,S.C.
