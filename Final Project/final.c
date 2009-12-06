#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define bool int
#define true 1
#define false 0

char* bubbleSort(char * list, int size) {
	bool swapped = false;
	do {
		swapped = false;
		int i;
		for(i = 0; i<size-2; i++) {
			int var1 = 0;
			__asm__(
				"movl $0, %3\n\t"
				"movl (%1,%0), %2\n\t"
				"incl %0\n\t"
				"cmp %2, (%1,%0)\n\t"
				"jg noswap\n\t"
				"movl $1, %3\n\t"
				"xchg %2, (%1,%0)\n\t"
				"decl %0\n\t"
				"movl %2, (%1,%0)\n"
				"noswap:\n\t"
				:"=r" (i), "=r" (list), "=r" (var1)
				:"r" (swapped)
			);
		}
	} while(swapped);
	return list;
}

int main() {
	char *list;
	list = (char *)malloc(100*sizeof(char));
	scanf("%[^\n\r]", list);
	printf("%s\n", list);
	printf("%s\n", bubbleSort(list, strlen(list)));
	free(list);

	return 0;
}

