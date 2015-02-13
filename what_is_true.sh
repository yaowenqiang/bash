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

echo 

echo "Testing \"-1\""
if [ -1 ]
then        # one
    echo "-1 is true."
else
    echo "-1 is false"
fi      # -1 为真

echo

echo "Testing \"NULL\""
if [ ]      # NULL(空状态)
then        
    echo "NULL is true."
else
    echo "NULL is false"
fi      # NULL 为假

echo

echo "Testing \"xys\""
if [ xyz ]      # 字符串
then        
    echo "Random string is true."
else
    echo "Ramdpm stromg is false"
fi      # 随便的一串字符为真

echo

echo "Testing \"|$xys\""
if [ $xyz ]      # 判断$xyz是否为NULL,但是...
                 # 这只是一个末初始化的变量。
then        
    echo "Uninitialized variable  is true."
else
    echo "Uninitialized variable is false"
fi      # 末定义的初始化为假。



echo

echo "Testing \"-n \$xys\""
if [ -n "$xyz" ] # 更加正规的条件检查。
then        
    echo "Uninitialized variable  is true."
else
    echo "Uninitialized variable is false"
fi      # 末定义的初始化为假。


echo
xyz=                #初始化了，但是是NULL值
echo "Testing \"-n \$xys\""
if [ -n "$xyz" ] # 更加正规的条件检查。
then        
    echo "Null variable  is true."
else
    echo "Null variable is false"
fi      # NULL变量为假。


echo
echo "Testing \"false\""
if [ "false" ] # 看起来"false" 只不过是一个字符串而已。
then
    echo "\"false\"  is true."
else
    echo "\"false\" is false"
fi      # false为真。

echo
echo "Testing \"\$false\""      # 再来一个末初始化的变量
if [ "$false" ]
then
    echo "\"\$false\"  is true."
else
    echo "\"\$false\" is false"
fi      # "$false"为假。
        # 现在我们得到了预期的结果

echo
echo "Testing \"\$true\""
if [ "$true" ]
then
    echo "\"\$true\"  is true."
else
    echo "\"\$true\" is false"
fi      # "$true"为假。
