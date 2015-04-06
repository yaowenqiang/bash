#!/bin/bash
# wget.sh

wget -p http://www.xyz23.com/file01.html
# -p 或-page-requisite选项将会使得wget取得所有在显示指定页时所需要的文件.(译者:比如内嵌的图片和样式表等)

wget -r http://www.xyz24.com/-bozo/project_files -O $SAVEFILE
#  -r 选项将会递归的从指定站点
#  上下载所有链接
