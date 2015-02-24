#!/bin/bash
# 算术测试
# math_test.sh

# (( ... )) 结构可以用来计算并测试算术表达式的结果。
# 退出状态将会与[ ... ] 结构完全相反!

(( 0 ))
echo "Exit status of \"(( 0 ))\" is $?."        # 1


(( 1 ))
echo "Exit status of \"(( 1 ))\" is $?."        # 0
