#!/bin/bash
# 通过文件重定向来使用read命令

read var1<data-file

echo "var1 = $var1"

# var1 将会把'data-file'的第一行的全部内容都作为它的值。

read var2 var3 <data-file
echo "var2 = $var2 var3 = $var3"

# 注意，这里的"read"命令将会产生一种不直观的行为，
# 1) 重新从文件的开头开始读入变量。
# 2) 每个变量都设置成了内容作为变量的值。
#    而不是之前的以整行内容作为变量的值。
# 3) 而最后一个变量将会取得第一行剩余的全部部分(译者注：不管是否有空格).
# 4) 如果需要赋值的变量个数比文件中第一行以空白分割的字符串个数还多的话，
#    那么这些变量将会被赋空值。
echo "--------------------------------------"

# 如何用循环来解决上边所提到的问题：
while read line

do
    echo "$line"
done <data-file     # TODO 这个写法很奇特。

echo "--------------------------------------"

# 使用$IFS(内部域分隔变量)来将每行的输入单独的放到'read'中，
# 前提是如果你不想使用默认空白的话。
echo "List of all users:"
OIFS=$IFS;IFS=:             # /etc/passwd 使用":"作为分隔符。
while read name passwd uid gid fullname ignore
do
    echo "$name ($fullname)"
done</etc/passwd            # I/O重定向
IFS=$OPOS                   # 恢复原始的$IFS

# 在循环内部设置$IFS变量。
# 而不用把原始的$IFS
# 保存到临时变量中，

echo "--------------------------------------"

while IFS=: read name passwd uid gid fullname ignore
do
    echo "$name ($fullname)"
done </etc/passwd               # I/O重定向

echo

echo "\$IFS still $IFS"
exit 0


