/***
 * CS220 Final Project
 * main.c
 * @author John Marshall (jmarsha6)
 */

#include <stdlib.h>
#include <stdio.h>

#include "final.h"

int main() {
	int listSize = 0;
	const int bufferSize = 16;
	char *list = (char *)malloc(bufferSize*sizeof(char));
	
	list = scanInput(list, bufferSize);
	listSize = getListSize();
	
	printf("Your string sorted: %s\n", bubbleSort(list, listSize));
	
	free(list);
	
	return 0;
}
