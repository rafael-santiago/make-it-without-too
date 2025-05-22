#include <stdio.h>
#include <stdlib.h>

int main(void) {
#if defined(SINCERAO)
    printf("make stinks!\n");
    printf("autotools idem!\n");
#else
    printf("make and autotools are... what they are.\n");
#endif
    return EXIT_SUCCESS;
}
