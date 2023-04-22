%{
#include <stdio.h>
%}

%option noyywrap

%%

[a-zA-Z]+    { printf("%s is a word\n", yytext); }
[0-9]+       { printf("%s is a number\n", yytext); }
[a-zA-Z0-9]+ { printf("%s is a combination of word and number\n", yytext); }
.            { printf("%s is not a valid input\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}
