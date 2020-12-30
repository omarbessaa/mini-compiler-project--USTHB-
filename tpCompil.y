%{
#include<stdio.h>
extern FILE* yyin ;
%}
%union
{char *ch ;
int ent ;
float rel ;
}

%token '+' '-' '*' '/' '<' '>' infE supE aff diff declar egal ';' ',' '(' ')' '#' '[' ']' m_float m_int m_string fin m_if debut findec dec langage execut m_while faire fait m_InOut Arithme m_Tab taille reel chaine cmntr entier idf
%token <ch> idf
%token <ent> entier
%token <rel> reel

%%
S : langage idf DDEC {printf ("programme correct\n");}
;
DDEC : dec DEC findec DPRG
;
DPRG : debut PRG fin
;
DEC : DBIB DVAR | DVAR
;
DBIB : '#' BIB DBIB | '#' BIB ';'
;
BIB : m_InOut | m_Tab | Arithme
;
DVAR : TYPEV declar VAR ';'
;
TYPEV : m_int | m_float | m_string
;
VAR : idf | idf ',' VAR | idf '[' taille ']' | idf '[' taille ']' VAR
;
PRG : INSTR | INSTR PRG
;
INSTR : AFF | BOUCLE | CONDIT
;
AFF : idf aff EXP | idf '[' taille ']' aff EXP
;
EXP : entier | reel | chaine | idf | idf EXPA EXP
;
EXPA : '+' | '-' | '*' | '/'
;
BOUCLE : m_while '(' COND ')' faire INSTR fait
;
COND : A EXPC A
;
A : idf | entier | reel
;
EXPC : '>' | '<' | supE | infE | egal | diff
;
CONDIT : execut INSTR m_if '(' COND ')'
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