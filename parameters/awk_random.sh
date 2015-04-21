#!/bin/bash
# awk_random.sh             产生一个范围在0-1之间的伪随机数
# 使用了awk的rand()函数

AWKSCRIPT='{srand();print rand()}'
# Command(s)            /传递给awk中的参数
# 注意，srnad()是awk中用来产生伪随机数种子的函数。

echo -n "Random number between 0 and 1 - "
# echo | awk "$AWKSCRIPT"
echo | awk "$AWKSCRIPT"
# 如果去掉'echo'，会怎样？  TODO 还没试验过

exit 0

# 练习:TODO
# 1) 使用循环结构，打印出10个不同的随机数
# （提示：在每次的循环过程中，你必须使用'srand()'函数来生成不同的种子）
# 如果你不这样做会怎样？

# 2）使用整数候选为一个比例因子，在10到100的范围之间，
# 来产生随机数
# 3) 同上边的练习#2,但是这次产生随机整数。
