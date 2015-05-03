#!/bin/bash - 
#===============================================================================
#
#          FILE: realname.sh
# 
#         USAGE: ./realname.sh 
# 
#   DESCRIPTION: 从username中取得用户的真名
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/03 21:34
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# 依靠username,从/etc/passwd 中获得"真名"
ARGCOUNT=1
E_WRONGARGS=65
file=/etc/passwd
pattern=$1
if [[ $# -ne "$ARGCOUNT" ]]; then
    echo "Usage:`basename $0` USERNAME"
    exit $E_WRONGARGS
fi
file_excerpt ()    # 按照要求的模式来扫描文件，然后拪文件相关的部分。
{
    while read line  # 'while'并不一定非得有"( condition )" 不可
    do
        echo "$line" | grep $1 | awk -F ":" '{print $5}'        # awk 用':'作为界定符.
    done
} < $file       # 重定向到函数的stdin.
# } < `grep $pattern < $file`       # 重定向到函数的stdin.

file_excerpt $pattern

# 是的，整个脚本其实可以被缩减为
# grep PATTERN /etc/passwd | awk -F ":" '{print $5}'
# 或
#
# awk -F ":" '/PATTERN/' '{print $5}'
# 
# 或
#
# awk -F: '/PATTERN/' '{print $5}'
# 
# 或
# awk -F: '{$1 == "username"}{print $5  }'  # 从usernameK 获得真名。但是，这些起不到示例作用。
exit 0
