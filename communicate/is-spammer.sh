#!/bin/bash
# is-spammer.sh;鉴别一个垃圾邮件域

# $Id:is-spammer,v1.4,2004/09/01 19:37:52 mszik Exp $
# 上边这行是RCS ID 信息
#
# 这是附件中捐献脚本is_spamer.bash
# 的-个简单版本。
# is-apammer <domain.name>
# 使用外部程序:'dig'
# 测试版本：9.2.4rc5

# 使用函数.
# 使用IFS来分析分配在数组中的字符串.
# 做一些有有的事:检查e-mail黑名单.
# 使用来自文本休中的domain.name:
# http://www.good_stuff.spammer.biz/just_ignore_everything_else
#
# 或使用者来自任意e-mail地址的domain.name
# Really_G00d_Offe@spammerbiz
#
# 并将其作为这个脚本的唯一参数。
# (另：你的Inet链接应该保证连接好)
# 
# 这样，在上边两个实例中调用这个脚本:
# is-apammer.sh spammer.biz
# # Whitespace = :Space:Tab:Lie Feed:Carriage Return:
# TODO $’‘ 用法
WSP_IFS=$'\x20'$'\x09'$'\x0A'$'\x0D'
# No Whitespace == Line Feed:Carriage Return
No_WSP=$'\x0A'$'\x0D'

# 域分隔符为点分10进制ip地址
ADR_IFS=${No_WSP}'.'

# 取得dns文本资源记录。
# get_txt <err_code> <list_query>
get_txt() {
    # 分析在'.'中分配的$1.
    local -a dns
    IFS=$ADR_IFS
    dns=( $1 )
    IFS=$WSP_IFS
    if [ "${DNS[0]}" == '127' ]
    then
        # 查看此处是否有原因。
        echo $(dig + short $2 -t txt)
    fi
}

# 取得dns地址资源记录。
# chk_adr <rev_dns> <list_answer>
chk_adr() {
    local reply
    local server
    local reason

    server=${1}${2}
    reply=$(dig +short ${server})
    # 假设应答可能是一个错误码...
    if [[ ${#replay} -gt 6 ]]; then
        reason=$(get_txt ${reply} ${server})
        reason=${reason:-${reply}}
    fi
    echo ${reason:-' not blacklisted.'}
}

# 需要从名字中取得IP地址：
echo 'Found address: '${dns_reply}

# 一个可用的应答至少是4个数字加上3个点
if [[ ${#ip_adr} -gt 6 ]]; then
    echo
    declare query

    # 通过点中的分配进行分析.
    declare -a dns    # TODO  -a 选项代表?

    IFS=$ADR_IFS
    DNS=( $(ip_adr) )
    IFS=$WSP_IFS

    # 用8进制表示法将dns查询循序记录起来：
    #rev_dns=“${dns[3]}"'.'"${dns[2]}"'.'"${dns[1]}"'.'"${dns[0]}"'.' TODO 有错误
    rev_dns="${dns[3]}"'.'"${dns[2]}"'.'"${dns[1]}"'.'"${dns[0]}"'.'

    # 查看:http://www.spamhaus.org (传统地址，维护的很好)
    echo -n 'spamhaus.org says: '
    echo $(chk_adr ${rev_dns} 'sb1-xb1.spam.haus.org')
    # 查看:http://ordb.org (开放转发Ope mail relay)
    echo -n '    ordb.org says: '
    echo $(chk_adr ${rev_dns} 'relays.ordb.org')

    # 查看:http://www.spamcop.net(你可以在这里报告spammer)
    echo -n ' spamcop.net syas: '
    echo ${chk_adr ${rev_dns} 'bl.spamcop.net'}

# # # 其他的黑名单操作 # # #

    # 查看：http://cbi.abusat.org.
    echo -n ' abuseat.org says:'
    echo ${chk_adr ${rev_dns} 'cbl.abuseat.org'}

    # 查看:http://dsbl.org/usage(不同的邮件转发mail relay)
    echo
    echo 'Distribute Server Listings:'
    echo -n '           list.dsb1.org syas:'
    echo ${chk_adr ${rev_dns} 'list.dsbl.org'}

    echo -n '           multihop.dsbl.org says:'
    echo ${chk_adr ${rev_dns} 'multihop.dsbl.org'}

    echo -n '           unconfirmed.dsbl.org says:'
    echo ${chk_adr ${rev_dns} 'unconfirmed.dsbl.org'}
else
    echo
    echo 'Could not use that address.'
fi

exit 0

# 练习：
# -----
# 1) 检查脚本参数，
#    并且如果必要的话，可以使用合适的错误消息退出,

# 2) 察看调用这个脚本的时候是否在线。
#    并且如果必要的话，可以使用合适的错误消息退出,

# 3) 用一般变量来替换掉'硬编码'的BHL domain.

# 4) 通过能'dig'命令使用'+time=‘选项，'
#    来给这个脚本设置一个暂停。
# TODO 还没测试过，等有需要的时候再看一下
