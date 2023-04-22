%{
 #include<stdio.h> 
 char userName[20];
%}

%option noyywrap

%%
[\n] {printf("\n Hello %s \n",userName); return 1 ; } 

%%

void main(){
    char opt; 
    do{
    printf("Enter the username: ");
    scanf("%s", userName);
    yylex();
    printf("Do you want to continue? (y/n) ");
    scanf("%c", &opt); 
    }while(opt == 'y'); 
    
}