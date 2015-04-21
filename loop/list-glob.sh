#!/bin/bash
# list-glob.sh    使用'globbing',在for循环中产生[list]

echo

for file in *
#                   在表达式中认别文件名匹配时，
#+                  Bash将执行文件名扩展。
do
    ls -l "$file"       # 列出在$PWD(当前目录)中的所有文件.
    # 回想一下，通配符"*"能够匹配所有文件
    #+然而，在"globbing"中，是不能匹配"."文件的.
    # 如果说匹配到任何文件，那它将扩展成自已。
    # 为了不让这种情况发生，那就设置nullglob选项.
    #+  (shopt -s nullglob)     TODO 这个地方看得不是很懂.
done

echo; echo

for file in [fp]*
do
    #rm -f $file            # 只删除当前目录下以"j"或"k"开关的文件。
    echo "Removed file \"$file\"".
done
echo
exit 0


