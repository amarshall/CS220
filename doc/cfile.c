/* This is a sample file written by Prof. Greene. */

#include <stdio.h>

int asm_procedure(int, int, int);

int c_procedure(int val1, int val2, int val3) {
  return (val1 + val2) * val3;
  }

int main() {
  printf("From ASM: %d\n", asm_procedure(3, 5, 6));
  printf("From C: %d\n", c_procedure(3, 5, 6));
  return 0;
  }
