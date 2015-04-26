#!/bin/bash - 
#===============================================================================
#
#          FILE: email.sh
# 
#         USAGE: ./email.sh 
# 
#   DESCRIPTION: 分析一个邮箱。
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 19:09
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

E_MISSING_ARG=67
if [[ -z "$1" ]]; then
    echo "Usage $0 mailbox-file"
    exit $E_MISSING_ARG
fi
mbox_grep()     # 分析邮箱文件
{
    declare -i body=0 match=0
    declare -a date sender
    declare maill header value
    while IFS= read -r mail    # 重新设置$IFS
    # 否则"read"会从它的输入中截去开头和结尾的空格 。
    do
        if [[ $mail =~ "^From " ]]; then
            # 匹配消息中的"From"域
            (( body = 0 )) # 取消(“Zero out"俚语)域
            (( match = 0 ))
            unset date
        elif (( body ))
        then
            (( match ))
            # echo "$mail"
            # 如果你想显示整个消息体的话，那么就打开上面的注释行。
        elif [[ $mail ]];then
            IFS=:read -r header value <<< "$mail"
            case "$header" in
                [Ff][Oo][Mm])[[ $value =~ "$2" ]] && (( match++ ));;
            # 匹配"From"行
                [Dd][Aa][Tt][Ee]) read -r -a date <<< "$value";;
            # 匹配"Date"行
                [Rr][Ee][Cc][Ee][Ii][Vv][Ee][Dd]) read -r -a sender <<< "$value";;
            #
            # 匹配IP地址(可能被欺骗)

            esac
        else
            (( body ++ ))
            (( match )) && \
                echo "MESSAGE ${date:+of: ${date[*]}}"
            # 整个$date数组.
            #
            echo "IP address of senders:${sender[1]}"
            # "Received"行的第二个域
        fi
    done < "$1" # 将文件的stdout重定向到循环中。
}

mbox_grep "$1" # 将邮箱文件发送到函数中
exit $?

# 练习:
# 1) 拆开上面这个函数，把它分成多个函数，
#    这样可以提高代码的可读性，
# 2) 对这个脚本添加额外的分析，可以不同的关键字。
