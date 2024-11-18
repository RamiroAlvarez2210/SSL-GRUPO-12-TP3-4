%{
#include <stdio.h>
#include <stdlib.h> 
#include <math.h>
extern char *yytext;
extern int yyleng;
extern int yylex(void);
extern void yyerror(char*);
int variable=0;
%}
%union{
   char* cadena;
   int num;
}
%token INICIO FIN LEER ESCRIBIR SUMA RESTA ASIGNACION
%token <cadena> ID
%token <num> CONSTANTE
%%
sentencia: INICIO {printf("Prueba\n");}
;
%%
int main() {
yyparse();
}
void yyerror (char *s){
printf ("Error\n");
}
int yywrap()  {
  return 1;  
}