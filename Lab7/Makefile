#  CS220 Lab #7
#  @author John Andrew Marshall (jmarsha6)
all: lab7
lab7.o: lab7.s
	gcc -Wall -g -c lab7.s -o lab7.o
lab7: lab7.o
	gcc -Wall -g lab7.o -o lab7


clean:
	rm -r *.o
	make

