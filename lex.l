%{
	#include <stdio.h>
%}
%option noyywrap
DIGITO [0-9]
const {DIGITO}({DIGITO})*
LETRA [a-zA-Z]
IDENTIFICADOR {LETRA}({LETRA}|{DIGITO})*
%%
{const}         {return CONSTANTE;}
"inicio"        {return INICIO;}
"fin"           {return FIN;}
"leer"          {return LEER;}
"escribir"      {return ESCRIBIR;}
{IDENTIFICADOR} {return ID;}
%%
int main()
{
    yylex();
    return 0;
}