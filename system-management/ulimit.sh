#!/bin/bash
# ulimit.sh    ulimit 示例
# 这个脚本只是为了展示用。
# 你要自己为运行这个脚本的后果负责 -- 它将*凝固*你的系统.

while true # 死循环
do
    $0 &        # 这个脚本调用自身，
                # fork 无数次
                # 直到系统完全不动，因为所有的资源都耗尽了.
done            # 这就像令人郁闷的“魔术师不断变出雨伞"的场景
exit 0          # 这里不会真正的退出，因为这个脚本不会终止.


