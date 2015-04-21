#!/bin/bash
# break-continue.sh

LIMIT=19            # 上限
echo "Printing Numbers 1 throught 20(but not 3 and 11)."
a=0
while [ $a -le "$LIMIT" ]
do
    a=$(($a+1))
    if [ "$a" -eq 3 ] || [ "$a" -eq 11 ]        # 除了3和11
    then
        continue
    fi
    echo -n "$a "                # 在$a等于3和11的时候，这名将不会执行。
done

# 练习:
# 为什么循环会打印出20?

echo;echo
echo Printing Numbers 1 through 20,but something happens after 2.
# ================================================================================
# 同样的循环，但是用'break'来代替'continue'

a=0
while [ "$a" -le "$LIMIT" ]
do
    a=$(($a+1))
    if [ "$a" -gt 2 ]
    then
        break
    fi
    echo -n "$a "
done
echo;echo;echo

exit 0
