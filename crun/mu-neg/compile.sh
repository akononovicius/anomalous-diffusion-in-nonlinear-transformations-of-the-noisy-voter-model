#!/bin/sh

gcc -o mu-neg.alpha125.X99990.o mu-neg.alpha125.X99990.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-neg.alpha200.X99990.o mu-neg.alpha200.X99990.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-neg.alpha400.X99990.o mu-neg.alpha400.X99990.c nvm.c -lgsl -lgslcblas -lm

gcc -o mu-neg.alpha125.X10.o mu-neg.alpha125.X10.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-neg.alpha200.X10.o mu-neg.alpha200.X10.c nvm.c -lgsl -lgslcblas -lm
gcc -o mu-neg.alpha400.X10.o mu-neg.alpha400.X10.c nvm.c -lgsl -lgslcblas -lm
