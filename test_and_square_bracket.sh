#!/bin/bash
# test_square_bracket.sh
 echo

 if test -z "$1"; then
     echo "No command-line arguments"
 else
     echo "First command-line argument is $1."
 fi

 echo

if /usr/bin/test -z "$1"; then          # 与内建的"test" 命令结果相同
     echo "No command-line arguments"
 else
     echo "First command-line argument is $1."
fi

echo

