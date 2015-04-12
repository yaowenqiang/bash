#!/bin/bash
SERVER=$HOST        # localhost.localdomain
PORT_NUMBER=25
nmap $SERVER | grep -w "$PORT_NUMBER" # 检查指定商品是否打开?
            # grep -w 匹配整个单词
            # 这样就不会匹配类似于1025这种含有25的商品了

exit 0
