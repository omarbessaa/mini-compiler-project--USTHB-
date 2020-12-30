%{
#include <stdio.h>
#include <string.h>
#include "tpCompil.tab.h"
extern YYSTYPE yylval;
int x;
%}
idf [A-Z]([a-zA-Z0-9])*
chiffre [0-9]
entier 0|([1-9]|("-"[1-9])){chiffre}*
reel (("-"[1-9])|[0-9])"."{chiffre}*
chaine """(.)*"""
cmntr "{{"(.)*"}}"
taille ([1-9])*
%%
"+" {printf("le mot %s est reconnu", yytext);
	return '+';}
"-" {printf("le mot %s est reconnu", yytext);
	return '-';}
"*" {printf("le mot %s est reconnu", yytext);
	return '*';}
"/" {printf("le mot %s est reconnu", yytext);
	return '/';}
"<" {printf("le mot %s est reconnu", yytext);
	return '<';}
">" {printf("le mot %s est reconnu", yytext);
	return '>';}
"<=" {printf("le mot %s est reconnu", yytext);
	return infE;}
">=" {printf("le mot %s est reconnu", yytext);
	return supE;}
":=" {printf("le mot %s est reconnu", yytext);
	return aff;}
"!=" {printf("le mot %s est reconnu", yytext);
	return diff;}
"::" {printf("le mot %s est reconnu", yytext);
	return declar;}
"==" {printf("le mot %s est reconnu", yytext);
	return egal;}
";" {printf("le mot %s est reconnu", yytext);
	return ';';}
"," {printf("le mot %s est reconnu", yytext);
	return ',';}
"(" {printf("le mot %s est reconnu", yytext);
	return '(';}
")" {printf("le mot %s est reconnu", yytext);
	return ')';}
"#" {printf("le mot %s est reconnu", yytext);
	return '#';}
"[" {printf("le mot %s est reconnu", yytext);
	return '[';}
"]" {printf("le mot %s est reconnu", yytext);
	return ']';}


"float" {printf("le mot %s est reconnu", yytext);
	return m_float;}
"int" {printf("le mot %s est reconnu", yytext);
	return m_int;}
"String" {printf("le mot %s est reconnu", yytext);
	return m_string;}
"Fin" {printf("le mot %s est reconnu", yytext);
	return fin;}
"IF" {printf("le mot %s est reconnu", yytext);
	return m_if;}
"Debut" {printf("le mot %s est reconnu", yytext);
	return debut;}
"FINDEC" {printf("le mot %s est reconnu", yytext);
	return findec;}
"DEC" {printf("le mot %s est reconnu", yytext);
	return dec;}
"LANGAGE" {printf("le mot %s est reconnu", yytext);
	return langage;}
"EXECUTE" {printf("le mot %s est reconnu", yytext);
	return execut;}
"While" {printf("le mot %s est reconnu", yytext);
	return m_while;}
"Faire" {printf("le mot %s est reconnu", yytext);
	return faire;}
"Fait" {printf("le mot %s est reconnu", yytext);
	return fait;}
"InOut" {printf("le mot %s est reconnu", yytext);
	return m_InOut;}
"Arithme" {printf("le mot %s est reconnu", yytext);
	return Arithme;}
"Tab" {printf("le mot %s est reconnu", yytext);
	return m_Tab;}

"\n" {printf("saut de ligne\n");}
" " {printf("saut de ligne\n");}

{entier} {if (strlen(yytext)>5) printf("\nErreur lexical: le mot %s nest pas reconnu",yytext);
		  else {x=atoi(yytext);
		       if(x<-32768 || x>32767) {printf("\nErreur lexical: le mot %s nest pas reconnu",yytext);}
		       else {printf("le mot %s est reconnu", yytext); return entier;}
             }			   
		}
{idf} {if (strlen(yytext)>12) printf("\nErreur lexical: le mot %s nest pas reconnu",yytext);
	    else {printf("le mot %s est reconnu", yytext); return idf;}
	  }
{cmntr} {printf("le mot %s est reconnu", yytext);}
{chaine} {printf("le mot %s est reconnu", yytext); 
		return chaine;}
{reel}	{printf("le mot %s est reconnu", yytext);
		return reel;}
{taille} {printf("le mot %s est reconnu", yytext);
	return taille;}
	
. {printf("\nErreur lexical: le mot %s nest pas reconnu",yytext);}
%%

int yywrap(void)
{
return 0;
}