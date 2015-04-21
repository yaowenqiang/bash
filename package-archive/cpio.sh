#!/bin/bash
# cpio.sh       copy input and output
# 使用cpio来拷贝目录树.

# 使用cpio的优点：
# 加速拷贝，比通过管道使用'tar'命令快一些，
# 很适合拷贝一些'cp'命令
# 搞不定的特殊文件(比如名字叫pipes的文件，等等)

ARGS=2
E_BADARGS=65
if [[ $# -ne "$ARGS" ]]; then
    echo "Usage: `basename $0` source destination"
    exit $E_BADARGS
fi

source=$1
destination=$2
find "$source" -depth | cpio -admvp "$destination"
#
# 阅读'find'和cpio的man页来了解这些选项的意义
# TODO 太复杂了
# 还需要理深入的看一下
