#!/bin/sh

[ -d "mu-neg" ]   && cd mu-neg  && sh compile.sh && cd ..
[ -d "mu-pos" ]   && cd mu-pos  && sh compile.sh && cd ..
[ -d "mu-zero" ]  && cd mu-zero && sh compile.sh && cd ..
[ -d "tau" ]      && cd tau     && sh compile.sh && cd ..
