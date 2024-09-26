#!/bin/sh

COMPILER=gfortran


${COMPILER} -c main.f90
${COMPILER} main.o -o main

rm main.o
