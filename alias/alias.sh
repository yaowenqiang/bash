#!/bin/bash - 
#===============================================================================
#
#          FILE: alias.sh
# 
#         USAGE: ./alias.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/05/04 00:05
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

shopt -s expand_aliases
# 必须设置这个选项，否则脚本不会打开另外功能。

# 首先，来点儿有趣的
#alias Jesse_James=`echo "\"Alias Jesse James\" was a 1959 comedy starring Bob Hope."`
#Jesse_James
#exit
echo;echo;echo;

alias ll='ls -l'
# 可以使用单引号(')或者双绰号(")来定义一个别名.
echo "Tring aliased \"ll\":"
ll /usr/X11R6/bin/mk*    # 别名工作了。

echo

directory=/usr/X11R6/bin/
prefix=mk*              # 看一下通配符会不会引起麻烦

echo "Variables \"directory\" + \"prefix\" = $directory$prefix"
alias lll='ls -l $directory$prefix'
echo "Tring aliased \"ll\":"
lll                     # 详细列出/usr/X11R6/bin目录下所有以mk开关的文件
# 另外能处理直接变量-- 包括通配符 --o.k.


TRUE=1
echo
if [[ TRUE ]]; then
    alias rr='ls -l'
    echo "Tring aliased \"rr\" within if/then statement."
    rr /usr/X11R6/bin/mk*           # 产生错误信息:
    # 别外不能在混合结构中使用。
    echo "However,previously expanded aliases still recognized."
    ll /usr/X11R6/bin/mk*
fi

count=0
while [ $count -lt 3 ] ; do
    alias rrr='ls -l'
    echo "Tring aliased \'rrr\' withing \'while\' loop:"
    rrr /usr/X11R6/bin/mk*          # 这里，别名也不会扩展
                                    # alias.sh:line 57:rrr: command not found
    let count+=1
done

echo;echo
alias xyz='cat $0'                  # 脚本打印自身内容。
                                    # 注意是单引号(强引用)
#xyz
# 虽然Bash文档建议，它不能正常运行，
# 不过它看起来是可以运行的，
# 参数”$0"立即扩展成了这个另外的声明。

exit 0
