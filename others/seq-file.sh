#!/bin/bash
# seq-file.sh
# 产生10个连续扩展名的文件，
# 名字分别是file.1 file.2 ... file.10,
COUNT=10
PREFIX=file
for i in `seq   $COUNT`
do
    touch $PREFIX.$i
    # 或者，你可以做一些其他的操作，
    # 比如rm,grep,等等。
done
exit 0


