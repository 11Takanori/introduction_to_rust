#include <stdio.h>
#include <stdlib.h>

#define swap(type, x, y) do { type t = x; x = y; y = t; } while (0)

void shell(int a[], int n)
{
    int i, j , h;

    for (h = n / 2; h > 0; h /= 2)
        for (i = h; i < n; i++) {
            int tmp = a[i];
            for (j = i - h; j >= 0 && a[j] > tmp; j-= h)
                a[j + h] = a[j];
            a[j + h] = tmp;
        }
}

int main(void)
{
    int i, nx;
    int *x;

    puts("item number: ");
    scanf("%d", &nx);
    x = calloc(nx, sizeof(int));

    for (i = 0; i < nx; i++) {
        printf("x[%d] : ", i);
        scanf("%d", &x[i]);
    }

    shell(x, nx);

    puts("------------");
    for (i = 0; i < nx; i++)
        printf("x[%d] = %d\n", i, x[i]);

    free(x);
    return 0;
}