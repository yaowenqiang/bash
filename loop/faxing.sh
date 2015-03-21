#!/bin/bash
# Faxing    (前提是"fax"必须已经安装好).

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Usage `basename $0` phone# text-file"
    exit $E_BADARGS
fi

if [ ! -f "$2" ]
then
    echo "File $2 is not a txt file"
    exit $E_BADARGS
fi

fax make $2                 # 从纯文本文件中创建传真格式的文件。
for file in $(ls $2.0*)     # 连接转换过的文件。
do                          # 在变量列表中使用通配符。
file="$fil $file"
done

efax -d /dev/tty$3 -01 -t "T$1" $fil    # 干活的地方。
# S.C.指出，通过以下命令可以省去for循环。
# efax -d /dev/tty$3 -ol -t "T$1" $2.0*
# 但这并不十分具有讲解意义[ 嘿嘿 ]。
exit 0
# TODO    没明白工作原理和作用。
