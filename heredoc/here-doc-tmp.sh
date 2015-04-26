#!/bin/bash - 
#===============================================================================
#
#          FILE: here-doc-tmp.sh
# 
#         USAGE: ./here-doc-tmp.sh 
# 
#   DESCRIPTION: Here document 创建临时文件
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 17:29
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# TODO
bash -c 'lsof -a -p $$ -d0' <<EOF
EOF

