#!/bin/bash
# tr-format-file-list.sh        格式化文件列表。

WIDTH=40                        # 设为40列宽。
b=`ls /bin`
echo $b | fmt -w $WIDTH

# 可以使用如下方法，作用是相同的.
# echo $b | fold - -s -w $WIDTH         TODO
exit 0
# TODO fmt还没搞懂是做什么的。
