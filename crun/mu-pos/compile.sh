#!/bin/sh

gcc -o mu-pos.alpha125.X99990.o mu-pos.alpha125.X99990.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-pos.alpha200.X99990.o mu-pos.alpha200.X99990.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-pos.alpha400.X99990.o mu-pos.alpha400.X99990.c nvm.c -lgsl -lgslcblas -lm

gcc -o mu-pos.alpha125.X10.o mu-pos.alpha125.X10.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-pos.alpha200.X10.o mu-pos.alpha200.X10.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-pos.alpha400.X10.o mu-pos.alpha400.X10.c nvm.c -lgsl -lgslcblas -lm
