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

exit 0
