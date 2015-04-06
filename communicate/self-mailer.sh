#!/bin/bash
# self-mailer.sh        mail自身的脚本。

adr=${1:-`whoami`}       #  如果没有指定的话，默认是当前用户
# 键入self-mailer.sh wiseguy@superduperenius.com
# 将脚本发送到这个地址，
# 如果只键入 'self-mailer.sh'(不给参数)的放，
# 那么这个脚本就会被发送给调用都，比如，比如，bozo@localhost.localdomain
# 如果想了解${parameter:-dfault}结构的更多细节，
# 请参考'变量重游'那章中的'参数替换'小节。
# ================================================================================
cat $0 | mail -s "Script \"`basename $0`\" has mailed itselft to you." "$adr" 
# ================================================================================

# ------------------------------
# 来自self-mailing脚本的一份祝福，
# 一个喜欢恶搞的家伙运行了这个脚本，
# 这导致了他自己收到了这份mail,
# 显然的，有些人确实没什么事好做和，
# 就只能浪费他们自己的时间玩了.
# ------------------------------
echo "At `date` \"`basename $0` \" mailed to '$adr'"

exit 0
