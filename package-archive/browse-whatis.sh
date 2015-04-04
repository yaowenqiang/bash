#!/bin/bash
# browse-whatis.sh;     浏览/usr/bin
#
# 所有在/usr/bin中的神秘二进制文件都是些什么东西？
#
DIRECTORY="/usr/bin"

# 也试试"/bin","/usr/bin","/usr/local/bin",等等.

for file in `ls $DIRECTORY/*`
do
    whatis `basename $file`         # 将会echo出这个２进制文件的信息。
done
exit 0

# 你可能希望这个脚本的输出重定向，像这样：
# ./what.sh >>whatis.db
# 或者一页一页的在stdout上察看。
# ./what.sh | less
