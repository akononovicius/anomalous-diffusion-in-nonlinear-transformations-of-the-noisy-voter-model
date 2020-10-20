#!/bin/sh

gcc -o mu-zero.alpha125.X99990.o mu-zero.alpha125.X99990.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-zero.alpha200.X99990.o mu-zero.alpha200.X99990.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-zero.alpha400.X99990.o mu-zero.alpha400.X99990.c nvm.c -lgsl -lgslcblas -lm

gcc -o mu-zero.alpha125.X10.o mu-zero.alpha125.X10.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-zero.alpha200.X10.o mu-zero.alpha200.X10.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-zero.alpha400.X10.o mu-zero.alpha400.X10.c nvm.c -lgsl -lgslcblas -lm
