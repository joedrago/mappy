#include <stdio.h>
#include <string.h>

// --------------------------------------------------------------------------------------
// This must match the gperf declaration "enough"

typedef void (*VoidFunc)(void);
typedef struct Symbol
{
    const char * name;
    VoidFunc func;
} Symbol;

Symbol * mappyLookup(register const char * str, register unsigned int len);

// --------------------------------------------------------------------------------------

int main(int argc, char * argv[])
{
    if (argc < 2) {
        printf("Supply a function name!\n");
        return;
    }

    const char * functionName = argv[1];
    Symbol * symbol = mappyLookup(argv[1], (unsigned int)strlen(functionName));
    if (symbol) {
        printf("Calling %s():\n", functionName);
        symbol->func();
    } else {
        printf("No such function: %s\n", functionName);
    }
    return 0;
}
