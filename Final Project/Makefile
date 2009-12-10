#  CS220 Final Project
#  @author John Andrew Marshall (jmarsha6)

all: final
main.o: main.c
	gcc -Wall -g -c main.c -o main.o
final.o: final.c
	gcc -Wall -g -c final.c -o final.o
final: main.o final.o
	gcc -Wall -g main.o final.o -o final

clean:
	rm -r *.o
	make
