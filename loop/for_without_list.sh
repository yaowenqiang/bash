#!/bin/bash

# for_without_list.sh
# 使用两种方式来调用这个脚本，一种带参数，另一种不带参数，
#+并观察在两种情况下，此脚本的行为。

for a
do
    echo -n "$a "
done

# 省略'in list'部分，因此循环将会操作"$@"
#+(包括空白的命令行参数列表).
echo 

exit 0

