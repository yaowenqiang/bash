#!/bin/bash
# builtin_variables.sh  #内置变量

# $BASH     Bash的二进制程序文件的路径
# $BASH_ENV 
# $BASH_SUBSHELL
# $BASH_VERSINFO

# Bash version info

for n in 0 1 2 3 4 5
do
    echo "BASH_VERSINFO[$n] = ${BASH_VERSINFO[$n]}"
done

#    BASH_VERSINFO[0] = 3                           # 主版本号,
#    BASH_VERSINFO[1] = 00                          # 次版本号,
#    BASH_VERSINFO[2] = 14                          # 补丁次数,
#    BASH_VERSINFO[3] = 1                           # 发行状态,
#    BASH_VERSINFO[4] = release                     # 结构体系,
#    BASH_VERSINFO[5] = i386_redhat-linux-gnu       # (与变量$MACHTYPE相同)
# $BASH_VERSION  安装在系统上的Bash版本号

# $DIRSTACK
# $EDITOR
# $EUID     "有效"用户ID

# FUNCNAME  当前函数的名字

xyz23()
{
    echo "$FUNCNAME now executing."     # 打印,xyz23 now executing.
}

xyz23

echo "FUNCNAME = $FUNCNAME"             # FUNCNAME = 
                                        # 超出函数作用域变为null值了.

# $GLOBIGNORE

# $GROUPS                               # 目前用户所属的组
# echo $GROUPS[1]
# echo $GROUPS[2]

# $HOME                                 # 用户的home目录
# $HOSTNAME                             # 系统名称
# $HOSTTYPE                             # 主机类Gooooo型
# $IFS                                  # 内部域分割符
echo $IFS | cat -vte
# TODO 下面这个不是很明白
#bash -c `set w x y z;IFS=":-:";echo "$*"`
# w:x:y:z
# (从字符串中读取命令，并分配参数给位置参数。)

# $IFS 处理空白与其他字符不同
output_args_one_per_line()
{
    for arg
    do echo "[$arg]"
    done
}
echo;
echo "IFS=\" \""
echo "-------"
IFS=" "
var=" a  b c   "
output_args_one_per_line $var       #output_args_one_per_line  `echo " a  b c   "`

# 
# [a]
# [b]
# [c]

echo;echo "IFS=:"
echo "-----"
IFS=:
var=":a::b:c:::"                    # 与上边一样，便是用" "替换了":".
output_args_one_per_line $var

# 
# []
# [a]
# []
# [b]
# [c]
# []
# []
# []

# 同样的事情也会发生在awk的"FS"域中。
echo

# $IGNOREEOF            忽略EOF

# $LC_COLLATE
# $LC_CTYPE
# LINENO                记录自身在脚本中所在的行号
# exit 0

# *** 高度代码块开始 ###
last_cmd_arg=$_         #  Save it.
echo "As line number $LINENO,variable \"v1\" = $v1"
echo "Last command argument processed = $last_cmd_arg"
# *** 高度代码块结束 ###


