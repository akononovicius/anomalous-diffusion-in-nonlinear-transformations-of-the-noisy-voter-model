#!/bin/sh

gcc -o tau.eta50.X10.o tau.eta50.X10.c nvmTau.c -lgsl -lgslcblas -lm
gcc -o tau.eta0.X10.o tau.eta0.X10.c nvmTau.c -lgsl -lgslcblas -lm
gcc -o tau.eta-100.X10.o tau.eta-100.X10.c nvmTau.c -lgsl -lgslcblas -lm
