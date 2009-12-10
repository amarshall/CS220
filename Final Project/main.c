/***
 * CS220 Final Project
 * main.c
 * @author John Marshall (jmarsha6)
 */

#include <stdlib.h>
#include <stdio.h>

#include "final.h"

// C++ is so much better...
#define bool int
#define true 1
#define false 0

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
	
	printf("%s\n", bubbleSort(list, listSize));
	free(list);

	return 0;
}
