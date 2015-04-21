3!/bin/bash
# factr.sh          分解约数    TODO 暂时先不做了，dc有需要再看。
MIN=2               # 如果比这个数小就不行了。
E_NOARGS=65
E_TOOSMALL=66

if [ -z $1 ]
then
    echo "Usage: $0 number"
    exit $E_NOARGS
fi
if [ $1 -lt "$MIN" ]
then
    echo "Number to factor must be $MIN or greater."
    exit $E_TOOSMALL
fi
# 练习: 添加类型检查(防止非整形的参数)
echo "Factors of $1:"
# --------------------------------------------------------------------------------
echo "$1[p]s2[lip/dli%0=1dvsr]s12sid2%0=13sidvsr[dli%0=1lrli2+dsi!>.]ds.xd1<2" | dc
# TODO  这个真心看不懂
# --------------------------------------------------------------------------------
exit 0
