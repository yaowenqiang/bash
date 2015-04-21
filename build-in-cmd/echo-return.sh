# 嵌入一个换行?
#!/bin/bash
echo "Why doesn't this string \n split on two lines?"
# 上边这句的\n将被打印出来，达不到换行的目的。
# 让我们再试试其他方法。

echo

echo $"A line of text containing
a linefeed."
# 打印出两个独立的换行(嵌入换行成功了。)
# 便是，是否必须有"$" 作为变量前缀?

echo

echo "This string splite
on two lines
"
# 不，并不是非"$"不可

echo
echo "--------"
echo

echo -n $"Another line of text containing
a linefeed."
# 打印出两个独立的换行(嵌入换行成功了。)
# 即使使用了-n选项，也没能阻止换行，(译者注：-n 阻止了第2个换行)
echo
echo
echo "--------"
echo
echo

# 然而，下边的代码就没能像期望的那样运行。
# 为什么失败？提示:因为分配到了变量。TODO
string1=$"Yet another line of text contraining 
a linefeed (mayby)."
echo $string1
#
# Yet another line of text contraining a linefeed (mayby).
# 
# 换行变成了空格。
exit 0
