#  CS220 Lab #6
#  @author John Andrew Marshall (jmarsha6)
all: PartA
PartA.o: PartA.s
	gcc -Wall -g -c PartA.s -o PartA.o
PartA: PartA.o
	gcc -Wall -g PartA.o -o PartA

PartB.o: PartB.s
	gcc -Wall -g -c PartB.s -o PartB.o
PartB: PartB.o
	gcc -Wall -g PartB.o -o PartB


clean:
	rm -r *.o
	make

