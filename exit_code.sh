#!/bin/bash
e exit_code.sh

echo hello
echo $?         # 退出状态为0,因为命令执行成功.

echo

lskdf           # 无效命令
echo $?         # 非零退出状态，因为命令执行失败.
echo

exit 113        # 返回113退出状态给shell,
                # 为了验证这个结果，可以在脚本第二听地方使用"echo $?"。
# 一般的，'exit 0' 表示成功。
#+而一个非零的退出码表示一个错误，或者是反常的条件。
