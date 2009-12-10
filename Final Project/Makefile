# CS220 Final Project
# @author John Andrew Marshall (jmarsha6)

all: final oxygen

main.s: main.c
	gcc -Wall -g -S main.c -o main.s
main.o: main.s
	gcc -Wall -g -c main.s -o main.o

final.s: final.c
	gcc -Wall -g -S final.c -o final.s
final.o: final.s
	gcc -Wall -g -c final.s -o final.o

final: main.o final.o
	gcc -Wall -g main.o final.o -o final

# Oxygen, get it? Like, O2.
oxygen: main.c final.c
	gcc -Wall -g -O -S main.c -o main-O.s
	gcc -Wall -g -O2 -S main.c -o main-O2.s
	gcc -Wall -g -O3 -S main.c -o main-O3.s
	gcc -Wall -g -O -S final.c -o final-O.s
	gcc -Wall -g -O2 -S final.c -o final-O2.s
	gcc -Wall -g -O3 -S final.c -o final-O3.s

clean:
	rm -f *.o
	rm -f *.s

