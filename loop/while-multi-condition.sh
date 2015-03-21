#!/bin/bash
# while-multi-condition.sh     多条件判断的while循环

var1=unset
previous=$var1

while echo "previous-variable = $previous"
    echo
    previous=$var1
    [ "$var1" != "end" ] # 记录之前的$var1.
    # 这个"while"中有4个条件,但是只有最后一个能够控制循环，
    # *最后*的退出状态就是由这最后一个条件来决定。
do
    echo "Input variable #1 (end to exit)"
    read var1
    echo "variable #1 = $var1"
done

# 尝试理解这个脚本的运行过程，
# 这里还有点小技巧的。
# TODO 没明白小技巧是什么。
exit 0

