#!/bin/bash
# findstring.sh
# 在一个指定目录的所有文件中查找一个特定的字符串。

directory=/usr/bin/
fstring="Free Software Foundation"      # 查看哪个文件中包含FSF.

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

# TODO
# 练习题(很简单)
# ----------
# 转换这个脚本，用命令行参数
# 代替内部的directory和fstring.





