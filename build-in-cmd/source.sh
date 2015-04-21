#!/bin/bash
# "include"一个数据文件。

. data-file         # 加载一个数据文件。
# 与'source data-file'效果相同，便是更具有可移植性。
# 文件'data-file'必须存在于当前目录。
# 因为这个文件是使用'basename'来引用的。
# 现在引用这个文件的一些数据。

echo "variable1 (from data-file) = $variable1"
echo "variable2 (from data-file) = $variable2"
echo "variable3 (from data-file) = $variable3"
let "sum = $variable2 + $variable4"
echo "Sum of variable2 + variable4 (from data-file) = $sum"
echo "message1(from data-file) is \"$message1\""
# 注意：                    将双绰号转义
print_message This is the message-print function in the data-file.
print_message "This is the message-print function in the data-file."
exit 0

