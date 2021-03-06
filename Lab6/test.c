/**
 * CS220 Lab #6
 * test.c
 * @author John Marshall (jmarsha6)
 */

#include <stdio.h>

#include "show.h"

int main() {
  int size = 0;

  char buffer[1024] = {"Hello world!"};
  printf("You entered: ");
  size = show_string(buffer);
  printf("\nSize: %d\n", size);

  char buffer2[1024] = {"How are you today?"};
  printf("You entered: ");
  size = show_string(buffer2);
  printf("\nSize: %d\n", size);

  char buffer3[1024] = {"Oh that's quite a shame."};
  printf("You entered: ");
  size = show_string(buffer3);
  printf("\nSize: %d\n", size);

  return 0;
}

