#!/bin/bash
# symlinks.sh;  列出目录中所有的符号链接文件。

directory=${1-`pwd`}
# 如果没有其他特殊的指定，
# 默认为当前工作目录。
# 下边的代码块，和上边这句等价。

# --------------------------------------------------------------------------------
ARGS=1                      # 需要一个命令行参数。
#
if [ $# -ne "$ARGS" ]       # 如果不是单个参数的话...
then
    directory=`pwd`         # 当前工作目录
else
    directory=$1            
fi

# --------------------------------------------------------------------------------
echo "symbolic linkes in directory \"$directory\""
for file in "$( find $directory -type l )"          # -type l = 符号链接
do
    echo "$file"
done | sort                                         # 否则的话， 列出的文件都是末经过排序的。

# 严格意义上说，这里并不一定非要一个循环不可，
# 因为"find" 命令的输出将被扩展成一个单词，
# 然而，这种方式很容易理解也很容易说明。

# 如果没有$( find $directory -type l )用""引用起来的话，
# 那么将会把一个带有空白部分的文件名拆分成以空白分隔的两部分(文件名允许空白),
# 即使这里只会取出每个参数的第一个域。

exit 0

# Jean Belou 建议用下边的方法：
# TODO
echo "symbolic linkes in directory \"$directory\""

OLDIFS=$IFS
IFS=;
for file in $(find -type l -printf "%p$IFS" )
do              #
                echo "$file"
            done | sort






