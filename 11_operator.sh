#!/bin/bash
# 11_operator.sh    使用10种不同方法计数到11.

n=1;echo -n "$n "

let "n = $n + 1"        # let "n = n + 1"也可以
echo -n "$n "

: $((n = $n + 1))
# ":" 是必须的，因为如果没有";"的话，
#+Bash将会尝试把"$((n = $n + 1))"解释为一条命令
echo -n "$n "

(( n = n + 1))

# 上面这句是一种更简单的方法。
echo -n "$n "
n=$(($n +1))
echo -n "$n "

: $[ n = $n + 1 ]
# ":" 是必须的，因为如果没有";"的话，
#+Bash将会尝试把"$[ n = $n + 1 ]"解释为一条命令
#+即使"n"被初始化为字符串，这句也能够正常运行。
echo -n "$n "

n=$[ $n +1 ]
echo -n "$n "

# 现在来一个c风格的增量操作
# 感谢Frank Wang.指出这点。
let "n++"               # let "++n"也可以
echo -n "$n "
(( n++ ))               # (( ++n ))也可以
echo -n "$n "
: $(( n++ ))            # :(( ++n ))也可以
echo -n "$n "

: $[ n++ ]            # :[ ++n ]也可以
echo -n "$n "
echo
exit 0
