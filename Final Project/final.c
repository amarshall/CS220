#include <stdlib.h>
#include <stdio.h>

// C++ is so much better...
#define bool int
#define true 1
#define false 0

bool bubbleSortHelper(int i, char *list, bool swapped) {
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
		:"b" (var1), "c" (var2)
	);
	return swapped;
}

char* bubbleSort(char * list, int size) {
	bool swapped = false;
	do {
		swapped = false;
		int i;
		for(i = 0; i<size-2; i++) {
			printf("%d\n", c);
			swapped = bubbleSortHelper(i, list, swapped);
		}
		if(!swapped) break;
		
		for(i = size-2; i >= 0; i--) {
			printf("%d\n", c);
			swapped = bubbleSortHelper(i, list, swapped);
		}
	} while(swapped);
	return list;
}

int main() {
	int listSize = 0;
	int bufferSize = 16;
	bool stillScanning = true;
	char *list = (char *)malloc(bufferSize*sizeof(char));
	
	while(stillScanning) {
		while(listSize < bufferSize) {
			char *i;
			scanf("%c", i);
			if(*i == '\n' || *i == '\r') {	// If input is done, stop
				stillScanning = false;
				break;
			}
			list[listSize] = *i;
			listSize++;
		}
		if(stillScanning) {
			bufferSize *= 2;
			char *tmp = (char *)malloc(bufferSize*sizeof(char));
			int i;
			for(i = 0; i < listSize; i++) {
				tmp[i] = list[i];
			}
			free(list);
			list = tmp;
			tmp = NULL;
		}
	}
	
	printf("%s", bubbleSort(list, listSize));
	free(list);

	return 0;
}

