#!/bin/bash

test () {

    A="$1"
    B="$2"
    echo "$A + $B "
}

echo "hoi"
ls
find ./  > /dev/null
set
ls
test $_ $?

