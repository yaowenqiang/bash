#!/bin/bash - 
#===============================================================================
#
#          FILE: virtual-file.sh
# 
#         USAGE: ./virtual-file.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-22 01:02
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# 用非交互的方式使用'vi'编辑一个文件。
# 模仿'sed'.

E_BADARGS=65
if [[ -z "$1" ]]; then
    echo "Usage `basename $0` filename"
    exit $E_BADARGS
fi
TARGETFILE=$1
# 在文件中写入两行，然后保存
#-----------------Begin here document----------------#
vi $TARGETFILE <<x23LimitStringx23
i
This is line 1 of the example file.
This is line 2 of the example file.

zz
x23LimitStringx23
#-----------------End here document----------------#
# 注意:上边^[是一个转义符，键入ctrl-v<Esc>就行。
# 事实上它是<Esc>键;

exit 0
