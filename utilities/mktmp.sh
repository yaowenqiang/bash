#!/bin/bash
# mktemp示例
PROFIX=filename
tempfile=`mktemp $PROFIX.XXXXXX`        
#                        在这个临时的文件名中，至少需要6个占位符
# 如果没有指定临时文件的文件名，
# 那么默认值就是'tmp.XXXXXXXXXX'
echo "tempfile name = $tempfile"
# tempfile name = filename.mP104w
#                 或者一些其他的相信的名字。

# 使用600为文件权限,
# 来在当前工作目录下创建一个这样的文件，
# 这样就不需要'umask 177'了，
# 便不管怎么说，这也是一个好的编程风格。

exit 0
