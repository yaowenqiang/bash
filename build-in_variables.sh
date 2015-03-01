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
# *** 调试代码块结束 ###

# $MACHTYPE         机器类型,标识系统的硬件

# ODLPWD            之前的工作目录

# $OSTYPE           操作系统顾炎武

# $PATH             可执行文件的搜索路径
# PATH=${PATH}:/opt/bin    将会把目录/opt/bin附加到当前目录列表中

# $PIPESTATUS       保存最后一个运行的前台管道的退出状态码

echo $PIPESTATUS

ls -al | bogus_command
echo $PIPESTATUS

ls -al | bogus_command
echo $?

# TODO 没看懂
echo $BASH_VERSION
ls | bogus_command | wc
echo ${PIPESTATUS[@]}

# $PPID     你进程的ID
# 和pidof比较一下
# $PROMPT_COMMAND       保存了在主提示符$PS1显示之前需要执行的命令
# $PS1                  主提示符，可以在命令行中见到它
# $PS2                  第二提示符，当你需要额外输入的时候，你就会看到它，默认显示">"
# $PS3                  第三提示符，它在一个select循环中显示
# $PS4                  第四提示符，当你使用-x选项来调用脚本时，这个提示
# 符会出现在第行的开头，默认显示"+".
# PWD                   工作目录(你当前所在的目录)
# 这与内建的pwd作用相同

E_WRONG_DIRECTORY=73
clear    # 清屏
TargetDirectory=/home/Administrator/projects/GreatAmericanNovel
cd $TargetDirectory
echo "Deleting stale files in $TargetDirectory"
# if [ "$PWD" != "$TargetDirectory" ] 
# then                                # 禁止偶然删除目录。
#     echo "Wrong directory!"
#     echo "In $PWD,rather than $TargetDirectory!"
#     echo "Bailing out!"
#     exit $E_WRONG_DIRECTORY
# fi
# rm -rf *
# rm -[A-Za-z0-9]*      # 删除点文件(隐藏文件)
# TODO 有点复杂，后面再仔细研究
# rm -f .[^.]*   ..?*   为了删除以多个点开头的文件
# ( shopt -s dotglob;rm -f * ) 也可以

# echo 
# echo "Done."
# echo "Old files deleted in $TargetDirectory"
# echo

# $REPLY     当没有参数变量提供给read命令的时候，这个变量会作为默认变量会作为默认变量提供给read命令,也可以用于select菜单,但是只提供所选择变量的编写，而不是变量本身

# $SECONDS        这个脚本已经运行的时间(以秒为单位)
# $SHELLOPTS      shell中已经激活的选项的列表，这是一个只读变量
# $SHLVL          Shell级别，就是Bash被嵌套的深度，如果是在命令行中，那么$SHLVL为１，如果在脚本中，那么$SHLVL为2

# $TMOUT
# 如果$TMOUT 环境变量被设置为非零值time的话，那么经过time秒后，shell提示符将会超时，这将会导致登出(logout)

# $UID
# 当前用户的用户ID标识号，记录在/etc/passwd文件中
