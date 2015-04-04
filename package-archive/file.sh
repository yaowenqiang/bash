#!/bin/bash
# 在给定目录中找出sh和Bash脚本文件;

DIRECTORY=/usr/local/bin
KEYWORD=Bourn

# Bourn和Bourn-Again shell脚本

file $DIRECTORY/* | grep $KEYWORD

