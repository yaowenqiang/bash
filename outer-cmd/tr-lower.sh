#!/bin/bash
# tr-lower.sh
# 
# 将当前目录下的所有文件名全部转换为小写。
# 

for filename in *           # 遍历当前目录下的所有文件。
do
    fname=`basename $filename`
    n=`echo $fname | tr A-Z a-z`a           # 将名字修改为小写，
    if [[ "$fname"  != "$n" ]]; then        # 只对那些文件名不是小写的文件进行重命名。
        mv $fname $n
    fi
done
exit $?

# 下边的代码将不会执行，因为上边的'exit'.
#---------------------------------------#

for $filename in *                          # 不必非得使用basename命令.
                                            # 因为'*'不会返回任何包含'/'的文件。
do
    n=`echo "$filename/" | tr '[:upper:]'` '[:lower:]' 
                                            # POSIX 字符集标注。
                                            # 添加的斜线是为了在文件名结尾换行不会被命令替换删掉。TODO 这个不知道是什么意思。
    # 变量替换:
    n=$(n%/)                                # 从文件名中将上边添加在结尾的斜线删除掉
    [[ $filename  ==  $n ]] || mv '$filename' $n
                                            # 检查文件名是否已经是小写。
done

exit $?

