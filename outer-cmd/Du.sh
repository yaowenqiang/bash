#!/bin/bash
# Du.sh             DOS到UNIX文本文件的转换。

E_BADARGS=65
if [ -z "$1" ]
then
    echo "Usage:`basename $0` filename-to-convert"
    exi4 $E_BADARGS
fi

NEWFILENAME=$1.unx

CR='\015'               # 回车。
                        # 015是8进制的ASCII码的回车。
                        # DOS中文本文件的行结束符是CR-LF.
                        # UNIX中文本文件的行结束符是LF.
tr -d $CR < $1 > $NEWFILENAME
echo "Original DOS text file is \"$1\"."
echo "Converted UNIX text file is \"$NEWFILENAME\"."
exit 0

# 练习:
# -----
# 修改上边的脚本完成从UNIX到DOS的转换。
# TODO
