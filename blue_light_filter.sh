#!/bin/bash

if [ $1 = "up" ]; then
	redshift -O 3500
else
	redshift -x
fi
