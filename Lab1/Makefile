# This is a sample file written by Prof. Greene.

all: lab1

lab1: asmfile.o cfile.o
	gcc -Wall asmfile.o cfile.o -o lab1

asmfile.o: asmfile.s
	gcc -Wall -c asmfile.s -o asmfile.o

cfile.o: cfile.s
	gcc -Wall -c cfile.s -o cfile.o

cfile.s: cfile.c
	gcc -Wall -S cfile.c -o cfile.s
