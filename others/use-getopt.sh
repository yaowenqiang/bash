#!/bin/bash
# use-getopt.sh     使用getopts

# 尝试使用下边的不同的方法来调用这脚本:
# sh use-getopt.sh -a
# sh use-getopt.sh -abc
# sh use-getopt.sh -a -b -c
# sh use-getopt.sh -d
# sh use-getopt.sh -dXYZ
# sh use-getopt.sh -d xyz
# sh use-getopt.sh -abcd
# sh use-getopt.sh -abcdZ
# sh use-getopt.sh -z
# sh use-getopt.sh a
# 解释上边的每一次调用的结果。

E_OPTERR=65
if [[ "$#" -eq 0 ]]; then
    echo "Usage:$0 -[options a,b,c]"
    exit $E_OPTERR
fi

set -- `getopt "abcd:" "$@"`
# 为命令行参数设置位置参数，
# 如果使用"$#"来代替"$@"的话，会发生什么?TODO

while [ ! -z "$1" ]
do
    case "$1" in
        -a)echo "Option \"a\"";;
        -b)echo "Option \"b\"";;
        -c)echo "Option \"c\"";;
        -d)echo "Option \"d\" $2";;
        *)break;;
    esac
    shift
done
# 通常来说在脚本中使用内建的'getopts'命令，
# 会比使用'getopt'好一些，
# 参见'ex33.sh'
exit 0
