#  @author: John Andrew Marshall (jmarsha6)
all: lab5 lab5a lab5b
lab5.o: lab5.s
	gcc -Wall -g -c lab5.s -o lab5.o
lab5: lab5.o
	gcc -Wall -g lab5.o -o lab5
lab5a.o: lab5a.s
	gcc -Wall -g -c lab5a.s -o lab5a.o
lab5a: lab5a.o
	gcc -Wall -g lab5a.o -o lab5a
lab5b.o: lab5b.s
	gcc -Wall -g -c lab5b.s -o lab5b.o
lab5b: lab5b.o
	gcc -Wall -g lab5b.o -o lab5b

clean:
	rm -r *.o
	make
