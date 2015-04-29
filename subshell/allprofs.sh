#!/bin/bash - 
#===============================================================================
#
#          FILE: allprofs.sh
# 
#         USAGE: ./allprofs.sh 
# 
#   DESCRIPTION: 打印出所有用户的配置文件 。
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/29 01:09
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

FILE=.bashrc        # 在原始脚本中，File containing user profile,
for home in `awk -F: '{print $6}' /etc/passwd` 
do
    [ -d "$home" ] || continue # 如果没有home目录，跳出本次循环.
    [ -r "$home" ] || continue # 如果 home目录没有读权限，则跳出本次循环。
    ( cd $home; [ -e $FILE ] && less $FILE)
done

# 当脚本结束时， 不必使用'cd'命令来返回原来的目录，
# 因为'cd $home'是在子shell 下产生的，不影响你shell
exit 0
