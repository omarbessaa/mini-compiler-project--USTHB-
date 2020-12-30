%{
#include<stdio.h>
#include "exp.tab.h"
extern YYSTYPE yylval;
%}
IDF [a-zA-Z]+
Entier 0|[1-9][0-9]*
%%
BEGIN { printf("Begin\n");
return BEGIN ;}
END { printf("End\n");
return END ;}
INT { printf("Int\n");
return INT ;}
";" { printf(";\n");
return ';' ;}
"=" { printf("=\n");
return '=' ;}
"\n" {printf("saut de ligne\n");}
" " {printf("saut de ligne\n");}
{Entier} {printf("entier\n");
yylval.entier=atoi(yytext) ;
return Entier ;}
{IDF} {printf("idf\n");
yylval.chaine=strdup(yytext) ;
return IDF ;}
. {printf("erreur\n");}
%%
int yywrap()
{return 0 ;
}