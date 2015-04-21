#!/bin/bash
# cut.sh

cut -d " " -f1,3        /etc/mtab
uname -a | cut -d " " -f1,3,11,12

# 使用cut命令从e-mail中提取消息头：
grep "Subject:" read-messages | cut -c10-80
Re:Linux suitable for mission-critical apps?
    MAKE MILLIONS WORKING ATHOME!!!
    Spam complaint
    Re: Spam complaint

# 列出所有在/etc/passwd中的用户。
FILENAME=/etc/passwd
for user in $(cut -d: -f1 $FILENAME)
do
    echo $user
done
# cat -d: -f1 < /etc/passwd
# cut -d " " -f2,3 filename 等价于awk -F'[ ]' '{print $2,$3}' filename
# cut 可以指定换行符作为字段定界符
