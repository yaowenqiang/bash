#!/bin/bash - 
#===============================================================================
#
#          FILE: and-or-mix-list.sh
# 
#         USAGE: ./and-or-mix-list.sh 
# 
#   DESCRIPTION: ’或列表'和'与列表'结合使用
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/06 02:08
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

E_BADARGS=65
if [[ -z "$1" ]]; then
    echo "Usage: `basename $0` filename"
    exit $E_BADARGS
else
    file=$1
fi
[ ! -f "$file" ] && echo "file \"$file\" not found,\
    Cowardly refusing to delete a nonexistent file. "
# 与列表，在文件不存在时将会给出错误信息。
[ ! -f "$file" ] || (rm -f $file;echo "File \"$file\" deleted.")
# 或列表，如果文件存在，那就删除文件。

# 注意，上边的两个逻辑相反，
# 与列表在true的情况下才执行， 或列表在fals 的时候才执行。
exit 0

