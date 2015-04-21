#!/bin/bash
# random-between.sh
# 产生两个指定值之间的随机数
randomBetween(){
    # 在$min和$max之间
    # 产生一个正的或负的随机数
    # 并且可以被$divisibleby所整除
    # 给出一个合理的随机分配的返回值。

    syntax(){
        # 在函数中包含函数
        echo
        echo "Syntax: randomBetween [min] [max] [multiple]"
        echo
        echo "Expects up to 3 passwd parameters,but all are completely optional"
        echo "min is the minimum value"
        echo "max is the maximum value"
        echo "multiple specifies that the answer must be a multiple of this value."
        echo "    i.e,answer must be evenly divisible by this number."
        echo
        echo "If any value is missing,defaults area supplied as: 0 32767 1"
        echo "Successful completion returns 0,unsuccessful completion returns "
        echo "function syntax and 1."
        echo "The answer is returned in the global variable randomBetweenAnswer"
        echo "Negative values for any passwd parameter are handled correctly."
    }
    
    local min=${1:-0}
    local max=${2:-32767}
    local divisibleby=${3:-1}
    # 默认值分配,用来处理没有参数传递进来的情况
    local x
    local speed
    
    # 确认divisibleby是正值
    [ ${divisibleby} -lt 0 ] && divisibleby=$((0-divisibleby))
    # 完整性检查
    if [ $# -gt 3 -o ${divisibleby} -eq 0 -o ${min} -eq ${max} ]; then
        syntax
        return 1
    fi

    # 查看min和max是否颠倒了
    if [[ ${min} -gt ${max} ]]; then
        # 交换它们。
        x=${min}
        min=${max}
        max=${x}
    fi
    
    # 如果min自已并不能够被divisibleby所整除，
    #+那么就调整max的值，使其能够被divisibleby所整除,前提是不能放大范围，
    if [[ $((min/divisibleby*divisibleby)) -ne ${min} ]]; then
        if [[ ${min} -lt 0 ]]; then
            min=$((min/divisibleby*divisibleby))
        else
            min=$(((min/divisibleby+1)*divisibleby))
        fi
    fi

    # 如果min自已并不能够被divisibleby所整除，
    #+那么就调整max的值，使其能够被divisibleby所整除,前提是不能放大范围，
    if [[ $((max/divisibleby*divisibleby)) -ne ${max} ]]; then
        if [[ ${max} -lt 0 ]]; then
            max=$(((max/divisibleby-1)*divisibleby))
        else
            max=$((min/divisibleby*divisibleby))
        fi
    fi
    # --------------------------------------------------------------------------------
    # 现在，来做点真正的工作，

    # 注意，为了得到对于端点来说合适的分配，
    #+随机值的范围不得不落在
    #+0和abs(max-min)+divisibleby之间，而不是abs(max-min)+1

    #  对于端点来说，
    #  这个少量的增加将会产生合适的分配
    #  如果修改这个公式，使用abs(max-min)+1来代替abs(max-min)+divisibleby的话，
    #+ 也能够得到正确的答案，但是在这种情况下所生成的随机值对于正好为端点倍数
    #+ 的这种情况来说将是不完美的，因为正好为端点倍数的情况下随机率要小的多(正常)
    #+ 为(divisibleby)

    spread=$((max-min))
    [ ${spread} -lt 0 ] && spread=$((0-spread))
    let spead=divisibleby
    randomBetweenAnswer=$(((RANDOM%spread)/divisibleby*divisibleby+min))
    return 0

    # 然而，Paulo Maroel coelho Aragao 指出，
    # 当$max 和 $min 不能够被divisibleby所整除时，
    #+这个公式将会失败
    # 他建议使用以下公式：
    # rnumber = $((RANDOM%(max-min+1)+min)/divisibleby+divisibleby)
}

# 让我们测试一下这个函数。
min=-14
max=24
divisibleby=3

# 产生一个所期望的数组answers,数组下标用来表示在范围能出现的值，
#+而元素内容记录的是这个值所出现的次数，如果我们循环足够多次，那么我们一定会得到至少一出现机会，

declare -a answer
minimum=${min}
maximum=${max}
if [ $((minimum/divisibleby*divisibleby)) -ne ${minimum} ]; then
    if [ ${minimum} -lt 0 ]; then
        minimum=$((minimum/divisibleby*divisibleby))
    else
        minimum=$(((minimum/divisibleby+1)*divisibleby))
    fi
fi
# 如果max本身并不能够被$divisibleby整除，
#+那么就调整max的值，使期能够被$divisibleby整除，前提是不能放大范围。
if [ $((maximum/divisibleby*divisibleby)) -ne ${maximum} ];then
    if [ ${maximum} -lt 0 ];then
        maximum=$((((maximum/divisibleby)+1)*divisibleby))
    else
        maximum=$((maximum/divisibleby*divisibleby))
    fi
fi

# 我们需要产生一个全部为正的数组，
# 所以我们需要一个displacement.
#+这样就可以保证结果都为正。

displacement=$((0-minimum))
for ((i=${minimum};i<${maximum};i+=divisibleby));do
    answer[i+displacement]=0
done

# 现在，让我们循环足够多的次数，来得到我们想要的答案，
loopIt=10000          # 脚本作者建议循环10000次，

for ((i=0;i<${loopIt};++i));do
    # 注意，我们在这里调用randomBetweenAnswer函数时，估计将min和max颠倒顺序，
    #+这是为了测试在这种情况下，此函数是否还能正确运行。
    randomBetween ${max} ${min} ${divisibleby}

    # 如果答案不是我们所期望的，就报错。

    [ ${randomBetweenAnswer} -lt ${min} -o ${randomBetweenAnswer} -gt ${max} ] && echo MIN or MAX error - ${randomBetweenAnswer}!
    [ $((randomBetweenAnswer%${divisibleby})) -ne 0 ] && echo DIVISIBLE BY error - ${randomBetweenAnswer}!

    # 将统计保存到answer中
    answer[randomBetweenAnswer+displacement]=$((answer[randomBetweenAnswer+displacement]+1))
    
done

# 让我们来看一下结果

for ((i=${minimum};i<=${maximum};i+=divisibleby));do
    [ ${answer[i+displacement]} -eq 0 ] && echo "We never got an answer of $i." || echo "${i} occurred ${answer[i+displacement]} times."
done
# TODO 太复杂了，算法还没看懂。
exit 0
