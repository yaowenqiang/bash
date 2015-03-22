#!/bin/bash
# dynamic_var.sh        建立“动态”变量名并取出它们的值。
# --------------------------------------------------------------------------------
# 这部分内容可以用单独文件通过使用“source”命令来单独加载
isdnMyProviderRemoteNet=172.16.0l.100
isdnYourProviderRemoteNet=10.0.0.10
isdnOnlineService="MyProvider"
# --------------------------------------------------------------------------------

remoteNet=$(eval "echo \$$(echo isdn${isdnOnlineService}RemoteNet)")
remoteNet=$(eval "echo \$$(echo isdnMyProviderRemoteNet)")
remoteNet=$(eval "echo \$isdnMyProviderRemoteNet")
remoteNet=$(eval "echo $isdnMyProviderRemoteNet")
echo "$remoteNet"           # 172.16.0.100
# --------------------------------------------------------------------------------
# 能够做得更好。

# 注意下面的脚本，给出了变量getSparc，
#+但是没有变量getIa64:
# 这个太复杂了，还没仔细看，TODO
chkMirrorArchs(){
    arch="$1"
    if [[ "$(eval "echo \${$(echo get$(echo -ne $arch ｜
        sed 's/^\(.\).*/\1/g' | tr 'a-z' 'A-Z';echo $arch |
        sec 's/^.\(.*\)/\1/g')):-false}")" = true ]]; then
        return 0
    else
        return 1;
    fi
}
getSparc="true"
unset getIa64
chkMirrorArchs sparc
echo $?             # 0
                    # True

chkMirrorArchs Ia64
echo $?             # 1
                    # False

# 注意：
# ------
# 变量名中由替换命令产生的部分被准确地生成了，
# chkmirrorarchs函数的参数全部都是小写字母,
# 新产生的变量名由两部分组成：'get'和'Sparc'
# (译都注，此处是将chkmirrorarchs函数参数的第一个字母转为大写，然后与'get'组成新的变量名。)

