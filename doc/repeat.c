#include <stdio.h>

#include "show.h"

int main() {
  int size = 0;
  char buffer[1024] = {0};

  printf("Enter a phrase: ");

  scanf("%[^\n\r]", buffer);

  printf("You entered: ");

  size = show_string(buffer);

  printf("\nSize: %d\n", size);

  return 0;
  }
