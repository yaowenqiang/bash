#!/bin/bash
# tr-upper.sh           转换大写，把一个文件的内容全部转换为大写。

E_BADARGS=65
if [ -z "$1" ]          # 检查命令行参数.
then
    echo "Usage:`basename $0` filename"
    exit $E_BADARGS
fi

tr A-Z a-z <"$1"

# 与上边的作用相同，便是使用了POSIX字符标记的方法：
# tr '[:lower:]' '[:upper:]' <"$1"

exit 0
# 练习:
# 重写这个脚本，通过选项可以控制脚本或者
# 转换为大写或者转换为小写。
# TODO 使用getopt来改写
