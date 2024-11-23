%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
extern char *yytext;
extern int yyleng;
extern int yylex(void);
extern void yyerror(char*);
%}
%union{
 char* cadena;
 int num;
}
%token INICIO FIN LEER ESCRIBIR MAS RESTA ASIGNACION PARENTESISIZQUIERDO PARENTESISDERECHO COMA PUNTOCOMA FDT
%token <cadena> ID
%token <num> CONSTANTE
%%
objetivo:programa FDT
;
programa:INICIO listasentencias FIN
;
listasentencias:sentencia
|listasentencias sentencia
;
sentencia:identificador ASIGNACION expresion PUNTOCOMA
|LEER PARENTESISIZQUIERDO listaidentificadores PARENTESISDERECHO PUNTOCOMA
|ESCRIBIR PARENTESISIZQUIERDO listaexpresiones PARENTESISDERECHO PUNTOCOMA
;
listaidentificadores:identificador
|listaidentificadores COMA identificador
;
listaexpresiones:expresion
|listaexpresiones COMA expresion
;
expresion:primaria
|expresion operadoraditivo primaria
;
primaria:identificador
|CONSTANTE
|PARENTESISIZQUIERDO expresion PARENTESISDERECHO
;
operadoraditivo:MAS
|RESTA
;
identificador:ID
;
%%
int main(){
yyparse();
}