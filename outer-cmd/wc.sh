#!/bin/bash
# wc.sh     使用wc命令来统计当前工作目录下有多少个.txt文件。
ls *.txt  &2>/dev/null | wc -l

# 因为列出的文件名都是以换行符区分的，所以使用-l来统计。

# 另一种方法
# find . -maxdeeps 1 -name \*.txt -print0 | grep -nz .
# (shopt -s nullglob;set -- *.txt; echo $#)
# TODO 好复杂，没完全看懂。

# 统计所以有d-h开头的文件的大小。
wc [d-z]* | grep total | awk '{print $3}'
# 如果系统语言是中文的话要把total改为'总用量'
wc [d-z]* | grep '总用量' | awk '{print $3}'
# 或者直接取最后一行
wc [d-z]* | tail -n 1 | awk '{print $3}'

