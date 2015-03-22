#!/bin/bash
# seconds.sh

# $SECONDS        这个脚本已经运行的时间(以秒为单位)

TIME_LIMIT=10
INTEVAL=1

echo

echo "Hit Control-C to exit before $TIME_LIMIT seconds"
echo
while [ "$SECONDS" -le "$TIME_LIMIT" ]
do
    if [ "$SECONDS" -eq 1 ]
    then
        units=second
    else
        units=seconds
    fi
    echo "This script has been running $SECONDS $units."
    # 在一台比较慢或者是负载过大的机器上，
    #+在单次循环中，脚本可能会忽略计数。
    sleep $INTEVAL
done

echo -e "\a"        #Beep!(哔哔声!)
exit 0
