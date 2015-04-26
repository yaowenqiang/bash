#!/bin/bash - 
#===============================================================================
#
#          FILE: commentblock.sh
# 
#         USAGE: ./commentblock.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 15:19
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

:<<COMMENTBLOCK
echo "This line will not echo."
This is a comment line missing the "#" prefix.
This is another comment line missing the "#" prefix.

&*@!!++=
The above line will cause no error message.
because the Bash interpreter will ignore it.
COMMENTBLOCK
echo "Exit value of above \"COMMENTBLOCK\" is $?."
# 0
# 这里将不会显示任何错误。

# 上边的这种技术当然也可以用来注释掉
# 一段正在使用的代码，如果你有某些特定调用要求的话，
# 这比在每行前边都敲入“#”来得方便的多。
# 而且如果你想恢复的话，还得将添加上的“#”删除掉。
: <<DEBUGXXX
for file in *
do
    cat "$file"
done
DEBUGXXX
exit 0
