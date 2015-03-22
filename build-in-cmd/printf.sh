#!/bin/bash
#  printf.sh    printf示例

PI=3.14159265358979
DecimalConstant=31373
Message1="Greetings."
Message2="Earthling."

echo

printf "Pi to 2 decimal places = %1.2f" $PI
echo

printf "Pi to 9 decimal places = %1.9f" $PI     # 都能够正确的结束。
printf "\n"                                     # 打印一个换行，等价于"echo"
printf "Constant = \t%d\n" $DecimalConstant     # 插入一个tab(\t)
printf "%s %s \n" $Message1 $Message2
echo

PI12=$(printf "%1.12f" $PI)
echo "Pi to 12 decimal places = $PI12"
Msg=`printf " %s %s \n" $Message1 $Message2`
echo $Msg;echo $Msg

