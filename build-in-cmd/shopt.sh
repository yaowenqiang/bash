#!/bin/bash
# shopt.sh              shopt示例

shopt -s cdspell
# 使用"cd"命令时，允许产生少量的拼写错误。
cd /hpme                # 噢，应该是'/home'
pwd                     # /home
                        # 拼写被纠正了。
