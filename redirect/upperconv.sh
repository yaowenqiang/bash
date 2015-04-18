#!/bin/bash - 
#===============================================================================
#
#          FILE: upperconv.sh
# 
#         USAGE: ./upperconv.sh 
# 
#   DESCRIPTION: 使用exec在同一个脚本中重定向stdin和stdout
#                将一个指定的输入文件转换为大写。
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-18 15:24
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

E_FILE_ACCESS=70
E_WRONG_ARGS=71
if [[ ! -f "$1" ]]; then
    echo "Can't read from input file!"
    echo "Usage: $0 input-file output-file"
    exit $E_FILE_ACCESS
fi                                          # 即使输入文件($!)没被指定，
                                            # 也还是会以相同的错误退出(为什么?)
if [[ -z "$2" ]]; then
    echo "Need to specify output file."
    echo "Usage: $0 input-file output-file"
    exit $E_WRONG_ARGS
fi

exec 4<&0
exec < $1                                    # 将会从输入文件中读取。

exec 7>&1
exec >$2                                    # 将写到输出文件中。
                                             # 假设输出文件是可写的(添加检查?)
# --------------------------------------------------------------------------------
cat - | tr a-z A-Z                           # 转换为大写。
#                                            # 从stdin中读取，
                                             # 写到stdout上。
# --------------------------------------------------------------------------------

exec 1>&7       7>&-                         # 恢复stdout
exec 0<&4       4<&-                         # 恢复stdin

# 恢复之后，下面这行代码将会如预期一下打印到stdout上。
echo "File \"$1\" written to \"$2\" as uppercase conversion."
exit 0
