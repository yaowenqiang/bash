#!/bin/bash

# random-example.sh

# 在6到30之间产生随机数
rnumber=$((RANDOM%25+6))
echo $rnumber

# 还是在6到30之间产生随机数
rnumber=$(((RANDOM%30/3+1)))
echo $rnumber

# 注意，并不是在所有情况下都能正确运行，
# 如果$RANDOM返回0,那么就会失败.
rnumber=$(( RANDOM%27/3*3+6))
echo $rnumber
# TODO 用法比较奇怪，看不懂。
exit 0
