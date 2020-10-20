#!/bin/sh

CORES=6

for f in tau.*.sh; do
    echo "Running $f"
    NAME="${f%.sh}"
    [ ! -d "$NAME" ] && mkdir "$NAME"
    parallel --jobs $CORES < "$f"
    paste -s -d , "$NAME"/*.series > ../../data/"$NAME".data
    rm -r "$NAME"
done
