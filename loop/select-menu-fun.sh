!#/bin/bash

FS3="Choose your favorite vegetable."

echo

choice_of()
{
    select vegetable
        # [in list]被忽略，所以"select"使用传递函数的参数。
    do
        echo
        echo "Your favorite veggie is $vegetable."
        echo "Yunk!"
        echo
        break
    done
}
choice_of beans rice carrots radishes tomatoes spinach
#           $1  $2      $3      $4      $5      $6
#           传递给choice_of的参数
exit 0
