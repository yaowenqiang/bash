#!/bin/bash
# grp.sh:       一个非常粗糙的'grep'命令的实现。

E_BADARGS=65

if [ -z "$1" ]      # 检查传递给脚本的参数。
then
    echo "Usage: `basename $0` pattern"
    exit $E_BADARGS
fi
echo
for file in *       # 遍历$PWD下的所有文件。
do
    output=$(sed -n /"$1"/p $file)      # 命令替换
    if [ ! -z "$output" ]
    then
        echo  -n "$file: "
        echo $output
    fi
done
echo

exit 0

# 练习：
# -----

# 1) 在任何给定的文件中，如果有超过一个匹配的话，在输出中添加新行。
# 2) 添加一些特征。
# TODO

