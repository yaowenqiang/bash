#!/bin/bash
# findstring.sh
# 在一个指定目录的所有文件中查找一个特定的字符串。
WRONG_ARGS=65
WRONG_DIR=66
if [ $# -ne 2 ]; then
    echo "Usage: `basename $0` dir-name search-string.";
    exit $WRONG_ARGS
fi

if [ ! -e $1 ]; then
    echo "Directory $1 does not exist!"
    exit $WRONG_DIR
fi
directory=$1
fstring=$2      # 查看哪个文件中包含FSF.

for file in $( find $directory -type f -name "*" | sort )
do
    # echo $file
    strings -f $file | grep "$fstring" | sed -e "s%$directory%%"
    # 在"sed"表达式中，
    # 我们必须换掉正常的替换分隔符"/",
    # 因为"/"碰巧是我们需要过滤的字符串之一,
    # 如果不用"%"代替"/"作为分隔符，那么巡个操作将失效，并给聘个错误消息，(试一试).
done

exit 0
