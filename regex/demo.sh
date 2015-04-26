#!/bin/bash - 
#===============================================================================
#
#          FILE: demo.sh
# 
#         USAGE: ./demo.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 22:22
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
sed -e 'N;s/.*/[&]/' << EOF   # Here Document
line1
line2
EOF
# 输出:
#[line
#ine2]

# N是sed中的一个命令，
# 将下一行添加到pattern space中，将当前读入行和用N命令添加的下一行看成是"一行"
# & 代表patten space匹配的内容，可以通过&来进行引用,在vim的ｓ命令中也同样适用．
# 后面还需要再深入研究一下，TODO
echo
awk '{ $0=$1 "\n" $2;if(/line.1/){print}}' << EOF
line 1
line 2
EOF
# 输出
# line
# 1

exit 0
