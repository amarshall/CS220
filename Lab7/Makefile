#  CS220 Lab #6
#  @author John Andrew Marshall (jmarsha6)
all: grades
grades.o: grades.s
	gcc -Wall -g -c grades.s -o grades.o
grades: grades.o
	gcc -Wall -g grades.o -o grades


clean:
	rm -r *.o
	make

