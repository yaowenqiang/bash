#!/bin/bash - 
#===============================================================================
#
#          FILE: avoid-subshell.sh
# 
#         USAGE: ./avoid-subshell.sh 
# 
#   DESCRIPTION: 避免子shell
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-18 15:47
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

lines=0
echo
cat myfile.txt | while read lines;          # 管道会产生子shell
do {
    echo $lines
    (( lines++ ))                           # 增加这个变量的值。
                                            # 便是外部循环都不能访问。
                                            # 子shell的值。

}
done
echo "Number of lines read = $lines"        # 0
                                            # 错误!
echo "--------------------"
exec 3<> myfile.txt
while read line <&3
do {
    echo "$line"
    (( lines++ ))                           # 增加这个变量的值。
                                            # 现在外部循环就可以访问了。
                                            # 没有子shell,现在就没问题了。
}
done
echo "Number of lines read = $lines"        # 8
echo
exit 0


