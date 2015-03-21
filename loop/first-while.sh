#!/bin/bash
# first-while   

echo                                        # 等价于
while [ "$var1" != "end" ]                 # while test "$var1" != "end"
do
    echo "input variable #1 (end to exit;)"
    read var1                               # 为什么不使用"read $var1"
    echo "variable #1 = $var1"              # 因为包含"#",所有需要""
    # 如果输入"end",那么就在这里echo,
    # 不在这里判断结束，在循环顶判断。
    echo
done
exit 0
