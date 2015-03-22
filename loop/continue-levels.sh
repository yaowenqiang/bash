#!/bin/bash
# continue-levels.sh   
# "continue N"命令，将上N层的循环全部被continue
for outer in I II III III IV V
do
    echo;echo -n "Group $outer;"
    # ================================================================================
    for inner in 1 2 3 4 5 6 7 8 9 10 #内部循环
    do
        if [ "$inner" -eq 7 ]
        then
            continue 2              # 在第2层循环上的contiune,也就是"外部循环"
            # continue
                                    # 使用"continue" 来替代这句，
                                    # 然后扯一下一个正常的循环的行为。
        fi
        echo -n "$inner "           # 7 8 9 10 将不会被echo.
    done
    # ================================================================================
    # 充者注:如果在此处添加echo当然也不会输出。
done

# 练习：        TODO
# 在脚本加入一个有意义的"continue N"
exit 0
