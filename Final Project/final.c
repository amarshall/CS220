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
		"movb (%%ebx), %%dl\n\t"
		"cmpb %%dl, (%%ecx)\n\t"
		"jle noswap\n\t"
		"movl $1, %%eax\n\t"
		"xchgb %%dl, (%%ecx)\n\t"
		"movb %%dl, (%%ebx)\n"
		"noswap:\n\t"
		:"=a" (swapped)
		:"b" (var1), "c" (var2), "a" (swapped)
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

