#include <stdio.h>

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

int main() {
  FILE *fp = fopen("input", "r");
  char spec[10 + 2];

  int maxid = 0;
  while (fgets(spec, sizeof(spec), fp)) {
    int seatid = 8 * get_row(spec) + get_column(spec);

    if (seatid > maxid)
      maxid = seatid;
  }

  printf("%d\n", maxid);
  return 0;
}
