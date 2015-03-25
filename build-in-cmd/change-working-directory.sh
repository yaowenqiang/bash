#!/bin/bash
# change-working-directory.sh    修改当前工作目录。

dir1=/usr/local
dir2=/var/spool

# pushd dir-name 把路径dir-name压入目录栈，同时修改当前目录到dir-name
# popd 将目录栈最上边的目录弹出，同时将当前目录改为刚弹出来的那个目录
pushd $dir1
# 将自动运行一个'dirs'(把目录栈的内容列到stdout上)
echo "Now in directory `pwd`."      # 使用后置引用的'pwd'.

# 现在对'dir1'做一些操作。
pushd $dir2
echo "Now in directory `pwd`."

# 现在对'dir2'做一些操作。
echo "The top entry in the DIRSTACK array is $DIRSTACK."
popd
echo "Now back to in directory `pwd`."

# 现在，对'dir1'做更多的操作。

popd
echo "Now back in original working directory `pwd`."

exit 0


# TODO
# 如果你不使用'popd'将会发生什么？--然后退出这个脚本?
# 你最后将落在哪个目录中?为什么？
