#  CS220 Final Project
#  @author John Andrew Marshall (jmarsha6)
all: final
final.o: final.c
	gcc -Wall -g -c final.c -o final.o
final: final.o
	gcc -Wall -g final.o -o final

clean:
	rm -r *.o
	make
