#include <stdio.h>
#include <stdlib.h>

char* bubbleSort(char * list) {

	return list;
}

int main() {
	char *list;
	list = (char *)malloc(100*sizeof(char));
	scanf("%[^\n\r]", list);
	printf("%s\n", list);
	printf("%s\n", bubbleSort(list));
	free(list);

	return 0;
}

