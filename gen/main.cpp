#include <stdio.h>

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("error: must specify an output file\n");
        return 1;
    }

    FILE *fp = fopen(argv[1], "w");
    fprintf(fp, "const char * hello() { return \"hello\"; }\n");
    fclose(fp);

    return 0;
}

