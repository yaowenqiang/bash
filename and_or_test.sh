#!/bin/bash
# and_or_test.sh

a=24
b=47

if [ "$a" -eq 24 ] && [ "$b" -eq 47 ]
then
    echo "Test #1 succeeds.";
else
    echo "Test #1 fails.";
fi

# ERROR:    if ["$a" -eq 24 && "$b" -eq 47 ]
#+          尝试运行 [ "$a" -eq 24 ]
#+          因为没找到匹配的']' 所以失败了'
#
#
# 注意，if [[ $a -eq 24 && $b -eq 47 ]] 也能正常运行
# 双中括号中的if-test结构要比
#+单中括号的if-test结构更加灵活.
# (在第17行的'&&'与第6行的'&&'具有不同的含义.)

if [ "$a" -eq 98 ] || [ "$b" -eq 47 ]
then
    echo "Test #2 succeeds."
else
    echo "Test #2 fails."
fi
#
# -a 和 -o 选项提供了
#+一种可选的混合条件测试的方法，
if [ "$a" -eq 24 -a "$b " -eq 47 ]
then
    echo "Test #3 succeeds."
else
    echo "Test #3 fails."
fi

if [ "$a" -eq 24 -a "$b" -eq 47 ]
then
    echo "Test #4 succeeds."
else
    echo "Test #4 fails."
fi

a=rhino
b=crocodile

if [ "$a" = rhino ] && [ "$b" = crocodile ]
then
    echo "Test #5 succeeds."
else
    echo "Test #5 fails."
fi

exit 0
