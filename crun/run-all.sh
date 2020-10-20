#!/bin/sh

[ -d ../data ] || mkdir ../data

[ -d "mu-neg" ]   && cd "mu-neg"  && sh run.sh && cd ..
[ -d "mu-pos" ]   && cd "mu-pos"  && sh run.sh && cd ..
[ -d "mu-zero" ]  && cd "mu-zero" && sh run.sh && cd ..
[ -d "tau" ]      && cd "tau"     && sh run.sh && cd ..
