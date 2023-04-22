%{
#include <stdio.h>
#include <string.h>
int num_lines = 0;
int num_words = 0;
int num_chars = 0;
int sc = 0; 
%}


%%
\n         { num_lines++; num_chars += yyleng; }
[ \t]      {sc++;  num_chars += yyleng;}
[^\t\n ]+  { num_words++; num_chars += yyleng; }

%%

int yywrap() { return 1; }


int main(void) {
    printf("Enter text to analyze:\n"); 
    yylex();
    printf("Lines: %d\nWords: %d\nCharacters: %d\n", num_lines, num_words, num_chars - sc);
    return 0;
}
