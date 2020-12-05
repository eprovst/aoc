#include <stdio.h>
#include <stdlib.h>

int partition(char *spec, int len, int min, int rng, char low) {
  if (len == 1) {
    if (spec[0] == low)
      return min;
    else
      return min + 1;
  }

  if (spec[0] == low)
    return partition(&spec[1], len - 1, min, rng / 2, low);
  else
    return partition(&spec[1], len - 1, min + rng / 2, rng / 2, low);
}

int get_row(char *spec) { return partition(spec, 7, 0, 128, 'F'); }

int get_column(char *spec) { return partition(&spec[7], 3, 0, 8, 'L'); }

int less(const void *a, const void *b) { return (*(int *)a - *(int *)b); }

int main() {
  FILE *fp = fopen("input", "r");
  char spec[10 + 2];

  int i = 0;
  size_t seats_size = 1;
  int *seats = malloc(sizeof(int));

  // Get all seat ids
  while (fgets(spec, sizeof(spec), fp)) {
    // Grow array
    if (i >= seats_size) {
      seats_size = 2 * seats_size;
      seats = realloc(seats, sizeof(int) * seats_size);
    }

    seats[i] = 8 * get_row(spec) + get_column(spec);
    ++i;
  }

  // Shrink array
  seats_size = i;
  seats = realloc(seats, sizeof(int) * seats_size);

  // Sort array and look for missing id
  qsort(seats, seats_size, sizeof(int), less);
  for (int i = 0; i + 1 < seats_size; ++i) {
    if (seats[i + 1] - seats[i] > 1) {
      printf("%d\n", seats[i] + 1);
      break;
    }
  }

  return 0;
}
