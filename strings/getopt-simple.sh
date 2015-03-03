#!/bin/bash
# getopt-simple.sh
# 

getopt_simple()
{
    echo "getopt_simple()"
    echo "Parameter are '$*'"
    until [[ -z "$1" ]]; do
        echo "Processing Parameter of: '$1'"
        if [[ ${1:0:1} = '/' ]]; then
            tmp=${1:1}                  # 去掉开头的'/'
            parameter=${tmp%%=*}       # 提取参数名
            value=${tmp##*=}            # 提取参数值。
            echo "Parameter: '$parameter',value: '$value'"
            eval $parameter=$value
        fi
        shift
    done
}
# 把所有选项传给函数getopt_simple().
getopt_simple $*

echo "test is '$test'"
echo "test2 is '$test2'"

exit 0
------
sh getopt-simple.sh /test=value1 /test2=value2

Parameter are '/test=value1 /test2=value2'
Processing Parameter of: '/test=value1'
Parameter:'test',value:'value1'
Processing Parameter of: '/test2=value2'
Parameter:'test2',value:'value12'
test is 'value1'
test2 is 'value2'
