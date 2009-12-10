# CS220 Final Project
# @author John Andrew Marshall (jmarsha6)

all: final oxygen

main.s: main.c
	gcc -Wall -g -S main.c -o main.s
main.o: main.s
	gcc -Wall -g -c main.s -o main.o

final.s: final.c
	gcc -Wall -S final.c -o final.s
final.o: final.s
	gcc -Wall -c final.s -o final.o

final: main.o final.o
	gcc -Wall -g main.o final.o -o final

# Oxygen, get it? Like, O2.
oxygen: main-O.s main-O2.s main-O3.s final-O.s final-O2.s final-O3.s
main-O.s: main.c
	gcc -Wall -O -S main.c -o main-O.s
main-O2.s: main.c
	gcc -Wall -O2 -S main.c -o main-O2.s
main-O3.s: main.c
	gcc -Wall -O3 -S main.c -o main-O3.s
final-O.s: final.c
	gcc -Wall -O -S final.c -o final-O.s
final-O2.s: final.c
	gcc -Wall -O2 -S final.c -o final-O2.s
final-O3.s: final.c
	gcc -Wall -O3 -S final.c -o final-O3.s

clean:
	rm -f *.o
	rm -f *.s

