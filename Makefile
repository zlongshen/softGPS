# Makefile for Linux etc.

.PHONY: all clean
all: bladegps interface

SHELL=/bin/bash
CC=gcc
CFLAGS=-O3 -Wall -I../bladeRF/host/libraries/libbladeRF/include
LDFLAGS=-lm -lpthread -L../bladeRF/host/build/output -lbladeRF -luhd

bladegps: bladegps.o gpssim.o getch.o
	${CC} $^ ${LDFLAGS} -o $@

interface: interface.o
	${CC} $^ -o $@

clean:
	rm -f *.o bladegps interface
