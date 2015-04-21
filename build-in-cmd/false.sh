#!/bin/bash
# false.sh

# 测试"false"
if false
then
    echo "false evaluaes \"true\""
else
    echo "false evaluaes \"false\""
fi

# 失败会显示"false"

# while "false"循环(空循环)
while false
do
    # 这里面的代码不会被执行。
    operation-1
    operation-2
    ..........
    operation-n
    # 什么事情都没发生!
done




