#!/bin/bash
# grep.sh

grep -c txt *.sgml  # (在"*.sgml"文件中，匹配"txt"的行数的总数。)
# grep -cz .
           # ^ 点
# 意思是计数(-c)所有以空白字符分割(-z)的匹配"."的项
printf 'a b\nc d\n\n\n\n\n\000\n\000e\000\000\nf' | grep -cz .      # 3 
# 代码中注释标注的是3 ，实际上运行结果是4 TODO
# TODO -z 选项还是不明白以什么为标准。
printf 'a b\nc d\n\n\n\n\n\000\n\000e\000\000\nf' | grep -cz "$"    # 5 
printf 'a b\nc d\n\n\n\n\n\000\n\000e\000\000\nf' | grep -cz "^"    # 5 
printf 'a b\nc d\n\n\n\n\n\000\n\000e\000\000\nf' | grep -c "$"     # 9 
# 默认情况下，是使用换行符(\n)来分隔匹配项，

# 注意：-z选项是GNU "grep"特定的选项。

# grep linux osinfo.txt /dev/null

SUCCESS=0       # 如果grep匹配成功
word=linux
filename=data.file

grep -q "$word" "$filename"     # '-q' 选项是什么都不输出到stdout上
if [ $? -eq $SUCCESS ]
    # if  grep -q "$sord" "filename"        # 这句话可以代替行5-7
then
    echo "$word found in $filename"
else
    echo "$word not found in $filename"
fi


