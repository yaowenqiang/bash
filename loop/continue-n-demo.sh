#!/bin/bash
# continue-example.sh
#--------------------------------------------------------------------------------
# Albert Reiner 一个关于使用"continue N"的例子：
# 假定我有很多作业需要运行，这此任务要处理一些数据，
# 这些数据保存在某个目录下的文件里，文件是以预先给定的模式进行命名的，
# 有机器要访问这个目录，
# 我想把工作都分配给这几台不同的机器，
# 然后我一般会在每台机器里运行类似下面的代码:
while true
do
    for n in .iso.*
    do
        [ "$n" = ".iso.opta" ] && continue
        beta=${n#.iso.}
        [ -r .iso.$beta ] && continue
        [ -r .lock.$beta ] && sleep 10 && continue
        lockfile -r0 .lock.$beta || continue
        echo -n "$beta: ` `data"
        run-isotherm $beta
        date
        ls -alF .iso.$beta
        [ -r .iso.$beta ] && rm -f .lock.$beta
        continue 2
    done
    break
done

# 在我的应用中的某些细节是很特殊的，尤其是sleep N.
# 但是更一般的横式是:
while true
do
    for job in {pattern}
    do
        {job already done or running} && continue
        { mark job as running,do job,mark job as done}
        continue 2
    done
    break           # 而所谓的"sleep 600" 只不过是想避免程序太快结束，而达不到
                    # 演示效果
done

# 脚本只有在当前任务都完成之后才会停止运行，
# （包括那些运行时新添加的任务）。
# 通过使用合适的lockfile,
# 可以使几台机器协作运行而不产生重复的处理。
# (在我这个例子中，重复处理会使处理时间延长一倍时间，因此我很想避免这个问题).
# 同样，如果每次都从头开始搜索，可以由文件名得到处理顺序，
# 当然，还有一种办法，也可以不使用'continue 2 '
# 但这样的话，就不得不检查相同的任务是不是已经被完成过了。
# （而我们应该马上找到下一个要运行的任务）
# (在演示的情况中，检查新任务前我们终止或睡眠了很长一段时间)
# TODO important 还没看懂，不过很有用。

