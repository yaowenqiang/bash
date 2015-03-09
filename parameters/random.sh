#!/bin/bash
# random.sh
# 每次调用$RANDOM都会返回不同的随机整数，
# 一般范围为:0-32767(有符号的16-bit整数)

MAXCOUNT=10
count=1
echo
echo "$MAXCOUNT random numbers:"
echo "-------------------------"
while [ "$count" -le "$MAXCOUNT" ]      # 产生10(MAXCOUNT)个随机整数。
do
    number=$RANDOM
    echo $number
    let "count += 1"        # 增加计数
done
echo "-------------------------"
