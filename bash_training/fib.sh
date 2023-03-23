#!/bin/bash

NUM=$1
fib (){
	FIB1=0
	FIB2=1
	COMB=0
	for ((i=0;i<$NUM;i++)) 
	do
		COMB=$(($FIB1 + $FIB2))
		FIB1=$FIB2
		FIB2=$COMB
	done

	echo $COMB
}

fib