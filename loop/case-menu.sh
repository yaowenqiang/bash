#!/bin/bash
# case-menu.sh
# 末经处理的地址资料

clear # 清屏

echo "              Contact List"
echo "              ------- ----"
echo "Choose one of the following persons."
echo
echo "[E]vans,Roland"
echo "[J]ones,Midred"
echo "[S]mith,Julie"
echo "[Z]ane,Morris"
echo

read person
case "$person" in
    # 注意，变量是被""引用的，

    "E" | 'e')
    # 接受大写或者小写输入。
    echo 
    echo "Roland Evans"
    echo "4321 Floppy Dr."
    echo "Hardacrabble,CO 80753"
    echo "(303) 734-9874"
    echo "(303) 734-9892 fax"
    echo "Business partiner & old friend"
    ;;
    "J" | 'j')
    echo 
    echo "Mildred Jones"
    echo "129 E,74th St.,Apt,19"
    echo "New York,NY 1009"
    echo "(212) 533-2914"
    echo "(212) 533-9972 fax"
    echo "milliej@loisaida.com"
    echo "Ex-girlfriend"
    echo "Birthday: Feb,11"
    ;;
    * )
    echo
    echo "Not yet in database."
    ;;
esac
echo

# TODO
# 练习：
# --------
# 修改这个脚本，让它能够接受多个输入，
# 并且能够显示多个地址。

exit 0





