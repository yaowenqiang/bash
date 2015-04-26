#!/bin/bash - 
#===============================================================================
#
#          FILE: prepend.sh
# 
#         USAGE: ./prepend.sh 
# 
#   DESCRIPTION: 在一个文件的开头添加文本。
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 17:49
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

E_NOSUCHFILE=65
read -p "File: " file   # "read"命令的-p参数用来显示提示符.
if [[ ! -e "$file" ]]; then
    echo "File $file not found."
    exit $E_NOSUCHFILE
fi

read -p "Title: " title
cat - $file <<<$title>$file.new
echo "Modified file is $file.new"
exit 0

# 下边是'man bash'中的一段
# Here String
# here document 的一种变形，形式如下：
# <<<word
# word被扩展并且被提供到command的标准输入中。


