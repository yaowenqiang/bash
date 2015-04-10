#!/bin/bash
# dd.sh          dd使用救命

# 将一个文件转换为大写:
#dd if=$filename conv=ucase > $filename.uppercase
                      #lcase 为ih

# self-copy.sh      一个拷贝自身的脚本

# 这个脚本会拷贝自身.
file_subscript=copy
dd if=$0 of=$0.$file_subscript 2>/dev/null
# 阻止dd产生消息;

exit $?

