#!/bin/bash
#remote.sh,使用ssh.
# 假设的一些前提：
# ---------------
# fd-2(文件描述符2)的内容并没有被丢弃( '2>/dev/null').
# ssh/sshd假设stderr('2')将会显示给用户.

# 假设sshd正运载在你机器上，
# 对于约大多数'标准'的发行版，都是有sshd的，
# 并且没有稀奇古怪的ssh-keygen.

# 在你的机器上从命令行中试着运行一下ssh:
# 
# $ ssh $HOSTNAME
# i 不需要特别的设置，也会要求你输入密码，
# 接下来输入密码,
# 完成后$ exit
# 能够正常运行么？如果正常的话，接下来你可以获得更多的乐趣了.
# 尝试在你的机器上以'root'身份来运行ssh:
# ssh -l root $HOSTNAME
# -l 代表login_name
# 当要求询问密码时，输入root的密码，注意别输入你的用户密码，
# Last login: Aug 10 20:25:49 2004 fro localhost.localdomain
# 完成后键入'exit'.

# 上边的动作将公带给你一个交互的shell，
# 也可以在'single command'模式下建立sshd,
# 但是这已经超出本便所讲解的范围了，
# 唯一需要注意的是，下面的命令都可以运行在
# ‘single command'模式下。

# 基本的，写stdout(本地)命令。
# ls -l
# 这样远端机器上就会执行相同的命令，
# 如果你想的话，可以传递不同的'USERNAME’和'HOSTNAME'
USER=${1:-$(WHOAMI)}
HOST=${2:-$(hostname)}

# 现在，在远端主机上执行上边的命令，
# 当然，所有的传输都会被加密，
ssh -l ${USER} ${HOST} " ls -l "

# 期望的结果就是在远端主机上列出
# 你的用户名所拥有的主目录下的所有文件，
# 如果想看点不一样的东西，
# 那就在别的地方运行这个脚本，别在你自己的目录下去运行这个脚本， 
# 如果你不想输入密码，
# 或者想更详细了解相关的问题，参考：
# man ssh
# man ssh-keygen
# man sshd_config.
exit 0
