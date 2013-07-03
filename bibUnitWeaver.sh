#!/bin/sh
#
# 7/14/2011. wes - wrote this to just mow through all the bibliography
# unit files that result from each of the chapters. this little shell
# script will keep the main makefile from getting too cluttered, as
# well as avoid the need to do manual makefile editing for each new
# chapter that comes in. I tried doing this loop in both sh and csh
# syntax, in one-line form, inside the Makefile, but didn't have
# much luck.
#

for i in bu*.aux ; do
    t=$(basename $i .aux)
    echo $i, $t
    bibtex $t
done

