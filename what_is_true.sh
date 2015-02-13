#!/bin/bash
# what_is_true.sh
# 什么是真
# 小技巧：
# 如果你不能够确定一个特定的条件应该如何进行判断，
#+那么就使用if-test结构.
echo
echo "Testing \"0\""

if [ 0 ]    #zero
then
    echo "0 is true."
else
    echo "0 is false."
fi          # 0 为真

echo

echo "Testing \"1\""
if [ 1 ]
then        # one
    echo "1 is true."
else
    echo "1 is false"
fi      # 1 为真
