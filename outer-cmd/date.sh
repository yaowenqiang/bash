#!/bin/bash
# 练习 data 命令

echo "The number of days since the year's beginning is `date +%j`."
# 需要在调用格式的前边加上一个"+"号.
# %j用来给出今天是本年度的第几天。

echo "The number of seconds since 01/01/1970 is `date +%s`"
# %s将产生'UNIX元年'到现在为止的秒数。
# 便是这东西现在还有用么?

prefix=temp
suffix=$(date +%s)          # 'date'命令的'+%s'是GNU特性.
filename=$prefix.$suffix
echo $filename
# 这是一种非常好的产生‘唯一’临时文件的办法。
# 甚至比使用$$都强。
# 如果想了解'date'命令的更多选项，请查阅这个命令的man页。
date +%N | sed -e 's/000$//' -e 's/^0//'
#                   去掉开头和结尾的0
date +%j
# 显示今天是本年度的第几天(从1月份开始计算).

date +%k:%M
# 使用24小时的格式来显示当前小时数和分钟数。
# "TZ"参数允许改变当前的默认时区。
date            
TZ=EST  date
SixDaysAgo=$(date --date='6 days ago')
OneMonthAgo=$(date --date='1 month ago')
OneYearAgo=$(date --date='1 year ago')
exit 0

