/***
 * CS220 Final Project
 * final.h
 * @author John Marshall (jmarsha6)
 */
 
#define bool int
#define true 1
#define false 0

char* scanInput(char * list, int bufferSize);
char* bubbleSort(char * list, int size);
bool bubbleSortHelper(int i, char * list, bool swapped);
int getListSize();
