%{
	#include <stdio.h>
%}
%option noyywrap
DIGITO [0-9]
CONSTANTE {DIGITO}({DIGITO})*
LETRA [a-zA-Z]
IDENTIFICADOR {LETRA}({LETRA}|{DIGITO})*
%%
{CONSTANTE}     printf("Constante\n");
"inicio"        {return INICIO;}
"fin"           {return FIN;}
"leer"          {return LEER;}
"escribir"      {return ESCRIBIR;}
{IDENTIFICADOR} printf("ID\n");
%%
int main()
{
    yylex();
    return 0;
}