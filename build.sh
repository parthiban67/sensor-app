#!/bin/sh

COMPILER=gfortran

${COMPILER} -c src/util/util_mod.f90 src/util/util_sub_mod.f90
${COMPILER} -c ./src/main.f90
${COMPILER} main.o util_mod.o util_sub_mod.o -o main

rm main.o
