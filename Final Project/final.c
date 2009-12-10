/***
 * CS220 Final Project
 * final.c
 * @author John Marshall (jmarsha6)
 */

#include <stdlib.h>
#include <stdio.h>

#include "final.h"

bool bubbleSortHelper(int i, char * list, bool swapped) {
	char *var1 = &list[i];
	char *var2 = &list[i+1];
	__asm__(
		"movb (%1), %%dl\n\t"
		"cmpb %%dl, (%2)\n\t"
		"jle noswap\n\t"
		"movl $1, %0\n\t"
		"xchgb %%dl, (%2)\n\t"
		"movb %%dl, (%1)\n"
		"noswap:\n\t"
		:"=r" (swapped)
		:"r" (var1), "r" (var2), "0" (swapped)
		:"edx"
	);
	return swapped;
}

char* bubbleSort(char * list, int size) {
	bool swapped = false;
	do {
		swapped = false;
		int i;
		for(i = 0; i < size-2; i++) {
			swapped = bubbleSortHelper(i, list, swapped);
		}
		if(!swapped) break;
		for(i = size-2; i >= 0; i--) {
			swapped = bubbleSortHelper(i, list, swapped);
		}
	} while(swapped);
	return list;
}

