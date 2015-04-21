#!/bin/bash
# awk-math.sh       使用awk脚本计算直角三角形和斜边,返回直接三角形的斜边
#                   (直角边长的平方和，然后对和取平方根)

ARGS=2              # 需要将２个直角边作为参数传递进来。
E_BADARGS=65        # 错误的参数值
if [ $# -ne "$ARGS" ]
then
    echo "Usage: `basename $0` side_1 side_2"
    exit $E_BADARGS
fi
AWKSCRIPT='{printf ("%3.7f\n",sqrt($1*$1 + $2*$2))}'
#                       命令/传递给awk的参数

# 现在，将参数通过管道传递给awk.
echo -n "Hypotenuse of $1 and $2 = "
echo $1 $2 | awk "$AWKSCRIPT"
exit 0
# TODO 添加边长大于0的判断
