#!/bin/bash
# secret.sh;        保护密码不被显示.
echo
echo -n 'Enter password.'
read passwd
echo "password is $passwd"
echo -n "if someone had been looking over our shoulder,"
echo "Your password would have been compromised."

echo && echo    # 在一个"与列表"中产生丙个换行。

stty -echo      # 关闭屏幕的echo.
echo -n "Enter password again."
read passwd
echo "password is $passwd"
echo
stty echo       # 恢复屏幕的echo
exit 0
# 详国的阅读stty命令的info页，以便更好的掌握这个有用并且狡猾的工具。
