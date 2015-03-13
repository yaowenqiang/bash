#!/bin/bash
# 列出所有的行星名称
for planet in Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto
do
    echo $planet            # 每个行星都被单独打印在一行上。
done

echo 

for planet in "Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto"
# 所有的行星名称都打印在一行上，
# 整个"list"都被双绰号封成了一个变量。

do
    echo $planet
done

# 用行星距太阳的距离来分配行星的名字

for planet in "Mercury 36" "Venus 67" "Earth 93" "Mars 142" "Jupiter 483"
do
    set -- $planet              # 解析变量 "$planet"并且设置位置参数
    # "--"将阻止$planet为空，或者是以一个破折号开关。TODO 不是很懂
    # 可能需要保存原始的位置参数，因为它们被覆盖了。
    # 一种方法就是使用数组，
    # original_param=("$@")
    echo "$1            $2,000,000 miles from the sum"
    #---------- two tabs----------把后边的和2连接起来
done
exit 0
