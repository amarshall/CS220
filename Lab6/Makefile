#  CS220 Lab #6
#  @author John Andrew Marshall (jmarsha6)
all: repeat repeat2 repeat3 repeat4 repeat5 test  test2 test3 test4 test5
show.o: show.c show.h
	gcc -Wall -g -c show.c -o show.o
repeat.o: repeat.c
	gcc -Wall -g -c repeat.c -o repeat.o
repeat: show.o repeat.o
	gcc -Wall -g show.o repeat.o -o repeat


show2.o: show2.s
	gcc -Wall -g -c show2.s -o show2.o
repeat2: show2.o repeat.o
	gcc -Wall -g show2.o repeat.o -o repeat2


show3.o: show3.s
	gcc -Wall -g -c show3.s -o show3.o
repeat3: show3.o repeat.o
	gcc -Wall -g show3.o repeat.o -o repeat3


show4.o: show4.s
	gcc -Wall -g -c show4.s -o show4.o
repeat4: show4.o repeat.o
	gcc -Wall -g show4.o repeat.o -o repeat4


show5.o: show5.s
	gcc -Wall -g -c show5.s -o show5.o
repeat5: show5.o repeat.o
	gcc -Wall -g show5.o repeat.o -o repeat5

test: show.o test.o
	gcc -Wall -g show.o test.o -o test
test2: show.o test.o
	gcc -Wall -g show2.o test.o -o test2
test3: show.o test.o
	gcc -Wall -g show3.o test.o -o test3
test4: show.o test.o
	gcc -Wall -g show4.o test.o -o test4
test5: show.o test.o
	gcc -Wall -g show5.o test.o -o test5


clean:
	rm -r *.o
	make
