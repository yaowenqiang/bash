#!/bin/bash
# uppercase.sh :  民输入，全部转换为大写

tr 'a-z' 'A-Z'
# 字符范围必须被 "" 引用起来
#+ 来阻止产生单 字符的文件名
exit 0

