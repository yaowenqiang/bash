#!/bin/bash - 
#===============================================================================
#
#          FILE: upload.sh
# 
#         USAGE: ./upload.sh 
# 
#   DESCRIPTION: 上传一对文件到"Sunsite"的"incoming"目录
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2015/04/26 11:08
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# 上传这一对文件(Filename.lsm,Filename.tar.gz)
# 到Sunsite/UNC(ibiblio.org)折incoming目录。
# Filename.tar.gz是自身的压缩包。
# Filename.lsm是描述文件。
# Sunsite需要"lsm"文件，否则就拒绝上传。
E_ARGERROR=65
if [[ -z "$1" ]]; then
    echo "Usage: `basename $0` Filename-to-upload"
    exit $E_ARGERROR
fi
Filename=`basename $1` # 从文件名中去掉目录字符串。
Server="ibiblio.org"
Directory="/incoming/Linuxo"
# 在这里也不一定非得将上边的参数写死在这个脚本中，
# 可以使用命令行参数的方法来替换。
Password="your.email.address" # 可以修改成相匹配的密码.
ftp -n $Server <<End-Of-Session
# -n 选项禁用自动登陆。
user anonymous "$Password"
binary
bell                    # 每个文件传输后，响铃。
cd $Directory
put "$Filename.lsm"
put "$Filename.tar.gz"
bye
End-Of-Session

exit 0
