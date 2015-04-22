#!/bin/bash - 
#===============================================================================
#
#          FILE: heredoc-ex.sh
# 
#         USAGE: ./heredoc-ex.sh 
# 
#   DESCRIPTION: 把所有后缀为'.txt'的文件，
#                中的'Smith'都替换成"Jones".
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015-04-22 23:35
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

ORIGINAL=Smith
REPLACEMENT=Jones
for word in $(fgrep -l $ORIGINAL *.txt)
do
    # ------------------------------
    ex $word <<EOF
    :%s/$ORIGINAL/$REPLACEMENT/g
    :wq
EOF
    #   :%s是'ex'的替换命令,
    #   :wq是保存并退出的意思。
    # ------------------------------
done

exit $?
