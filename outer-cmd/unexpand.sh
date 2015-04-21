#!/bin/bash
# unexpand.sh         把每个空格转化为tab。
string="string with space."
echo $string
echo $string | unexpand 
# TODO 暂时没怎么用到
