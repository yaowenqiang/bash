#!/bin/bash
# quote-fetch.sh    下载一份股票报价。


E_NOPARAMS=65       # 必须指定需要获取的股票(代号).
if [[ -z "$1" ]]; then
    echo "Usage:`basename $0` stock-symbol"
    exit $E_NOPARAMS
fi

stock_symbol=$1
file_suffix=.html
# 获得一个HTML文件，所以要正确命名它。
URL="http://finance.yahoo.com/q?s="
# Yahool金融版块，后缀是股票查询.

# --------------------------------------------------------------------------------
wget -O ${stock_symbol}${file_suffix} "${URL}${stock_symbol}"
# --------------------------------------------------------------------------------

# 在http://search.yahoo.com上查询相关材料:
# --------------------------------------------------------------------------------
#URL="http://search.yahoo.com/search?fr=ush-news&p=${query}"
wget -O "$savefilename" "${URL}"

# --------------------------------------------------------------------------------
# 保存相关URL列表.
exit $?

# 练习：
# 1) 添加一个测试来验证用户是否在线。
#    (暗示:对'ppp'或'connect'来分析'ps -ax’的输出')

# 2) 修改这个脚本，让这个脚本具有获得本地天气预报的能力。
#    将用户的zip code 作为参数。
# TODO 

