#!/bin/bash
# losetup.sh

SIZE=1000000 # 1 meg
head -c $SIZE < /dev/zero > file    # 建立指定尺寸的文件
losetup /dev/loop0 file             # 作为loopback设备来创建。
mke2fs /dev/loop0                   # 创建文件系统。
mount -o loop /dev/loop0 /mnt       # mount


