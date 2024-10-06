#!/bin/sh

COMPILER=gfortran

${COMPILER} -c src/util/util_mod.f90 src/util/util_sub_mod.f90
${COMPILER} -c src/util/random_mod.f90
${COMPILER} -c src/sensor/sensor_data_mod.f90
${COMPILER} -c src/sensor/sensor_persistence_mod.f90 \
 src/sensor/sensor_persistence_submod.f90
${COMPILER} -c src/sensor/sensor_emit_mod.f90 \
 src/sensor/sensor_emit_submod.f90
${COMPILER} -c ./src/main.f90
${COMPILER} main.o util_mod.o util_sub_mod.o random_mod.o \
 sensor_data_mod.o \
 sensor_emit_mod.o sensor_emit_submod.o sensor_persistence_mod.o \
 sensor_persistence_submod.o -o main

rm *.o
rm *.smod
rm *.mod
