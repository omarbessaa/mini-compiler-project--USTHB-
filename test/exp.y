%{
#include<stdio.h>
extern FILE* yyin;
#include "list.h"
ListElts L=NULL;
%}
%union
{char *chaine ;
int entier ;
}
%token BEGIN END INT ';' '='
%token <chaine> IDF
%token <entier> Entier
%%
S : BEGIN Dec Aff END {printf ("programme correct\n");}
;
Dec : INT IDF ';' {printf("Déclaration de %s\n",$2) ;
}
;
Aff : IDF '=' Entier ';' {printf("Affectation de la valeur %d\n",$3) ;}
;
%%
int yyerror(char* msg)
{printf("%s",msg);
return 1;
}
int main()
{
yyin=fopen("code.txt","r");
yyparse();
return 0;
}