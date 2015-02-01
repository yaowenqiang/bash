#!/bin/bash
args=$#         #位置参数的个数
lastargs=${!args}
# 或:       lastargs=$(!#)
# 注意，不能直接使用lastargs=$(!$#),这样会产生错误
echo  $lastargs
