#!/bin/sh

for ((ii=0; ii<1000000; ii=ii + 5000));
do
    start=$ii;
    let "end=($ii + 5000)";

    dir=$start"_"$end;

    mkdir $dir;

    for ((i=$start; i<$end; i++));
    do
        file="servers/"$i".png";

        if [ -f $file ];then
            cp -vf "servers/"$i".png" $dir"/";
            continue;
        fi
    done;
done;
