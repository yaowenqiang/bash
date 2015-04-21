#!/bin/bash
# symlinks-redirect;  列出目录中所有的符号链接文件。

OUTFILE=symlinks.list                           # 保存符号链接文件名的文件。

directory=${1-`pwd`}

# 如果没有其他特殊的指定，
# 默认为当前工作的目录。

echo "symbolic linkes in directory \"$directory\"" > "$OUTFILE"
echo "--------------------"     >> "$OUTFILE"

for file in "$( find $directory -type l )"
do
    echo "$file"                                # 循环的stdout
                                                # 重定向到一个文件中.
done | sort >> "$OUTFILE"

exit 0
