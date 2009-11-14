#  @author: John Andrew Marshall (jmarsha6)
all: No19
No19.o: No19.s
	gcc -Wall -g -c No19.s -o No19.o
No19: No19.o
	gcc -Wall -g No19.o -o No19

clean:
	rm -r *.o
	make
