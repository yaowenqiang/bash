#!/bin/bash
# pick-card.sh

# 这是一个从数组中取出随机元素的一个例子。

# 抽出一张牌，任何一张。

# Suites="Clubs
# Diamonds
# Hearts
# Spades"

Suites="梅花
方块
红桃
黑桃"

Denominations="2
3
4
5
6
7
8
9
10
Jack
Queen
King
Ace"

# 注意变量的多行展开。

suite=($Suites)                     # 读入一个数组。
Denomination=($Denominations)
num_suites=${#suite[*]}             # 计算有多少个数组元素
num_denominations=${#Denomination[*]}             # 计算有多少个数组元素

echo -n ${suite[$((RANDOM%$num_suites))]}
echo " ${Denomination[$((RANDOM%$num_denominations))]}"
# TODO 不是很懂怎么实现的


