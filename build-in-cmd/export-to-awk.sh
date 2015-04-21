#!/bin/bash
# export-to-awk.sh           # 使用export命令来闺怨一个变量传递到一个内嵌awk脚本中

# 这里是"求列的和"脚本的另外一个版本(col-totaler.sh)
# 那个脚本可以把目标文件中的指定的列上的所有数字全部累加起来，求和，
# 这个版本将把一个变量通过export的形式传递到'awk'中...
# 并且把awk脚本放到一个变量中。
ARGS=2
E_WRONGARGS=65
if [ $# -ne "$ARGS" ]
then
    echo "Usage: `basename $0` filename column-number"
    exit $E_WRONGARGS
fi

filename=$1
column_number=$2

#==== 上边的这部分，与原始脚本完全一样。====#
export column_number
# --------------------------------------------------------------------------------
awkscript='{ total += $ENVIRON["column_number"] }
# ENVIRON 为awk内置变量,参考
# http://www.chemie.fu-berlin.de/chemnet/use/info/gawk/gawk_11.html
# http://www.chemie.fu-berlin.de/chemnet/use/info/gawk/gawk_toc.html 
END { print total}'
# 是的，变量可以保存awk脚本。
# --------------------------------------------------------------------------------

# 现在，运行这个脚本。
awk "$awkscript" "$filename"
exit 0

