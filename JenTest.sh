#!/bin/bash

NAME=$1
LNAME=$2
COND=$3

if [ "$COND" == "true" ] ; then
	echo "Hello $NAME $LNAME, current time is $(date)"
else
	echo "Error !!!"
fi
