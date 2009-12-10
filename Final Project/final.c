/***
 * CS220 Final Project
 * final.c
 * @author John Marshall (jmarsha6)
 */

#include <stdlib.h>
#include <stdio.h>

#include "final.h"

int listSize;

char* scanInput(char * list, int bufferSize) {
	bool stillScanning = true;
   listSize = 0;
	
	while(stillScanning) {
		if(listSize < bufferSize) {
			char *i;  //Must *not* be initialized or will segfault
			scanf("%c", i);
			if(*i == '\n' || *i == '\r') {  // If input is done, stop
				stillScanning = false;
				break;
			}
			list[listSize] = *i;
			listSize++;
		} else if(stillScanning) {  // Reallocates and copies to new space
			bufferSize *= 2;
			char *tmp = (char *)malloc(bufferSize*sizeof(char));
			int i;
			for(i = 0; i < listSize; ++i) {
				tmp[i] = list[i];
			}
			free(list);  // Free the old list
			list = tmp;  // Point list to the new list
		}
	}
	
	return list;
}

/**
 * Actually a "cocktail sort"
 */
char* bubbleSort(char * list, int size) {
	bool swapped = false;
	do {
		swapped = false;
		int i;
		for(i = 0; i <= size-2; ++i) {
			swapped = bubbleSortHelper(i, list, swapped);
		}
		if(!swapped) break;
		for(i = size-2; i >= 0; --i) {
			swapped = bubbleSortHelper(i, list, swapped);
		}
	} while(swapped);
	return list;
}

bool bubbleSortHelper(int i, char * list, bool swapped) {
	char *var1 = &list[i];
	char *var2 = &list[i+1];
	__asm__(
		"cmpb %3, %4\n\t"
		"jle noswap\n\t"
		"xchgb %0, %1\n\t"
		"movl $1, %2\n\t"
		"noswap:\n\t"
		:"=r" (*var1), "=r" (*var2), "=r" (swapped)
		:"0" (*var1), "1" (*var2), "2" (swapped)
	);
	return swapped;
}

int getListSize() {
   return listSize;
}
