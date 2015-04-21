#!/bin/bash
#author jack yao
# date 2913-06-09
# Purpose: test the command substitution 
a=$(ls | wc)
echo 'a'
b=`ls | wc`
echo $a;
echo $b;
