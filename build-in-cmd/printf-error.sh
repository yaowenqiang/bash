#!/bin/bash

E_BADDIR=65

var=nonexistent_directory
error()
{
    printf "$@" >&2
    #@ 格式化传进来的位置参数，并把它们送到stderr.
    echo
    exit $E_BADDIR
}
cd $var  || error $"Can't cd to %s." "$var"
