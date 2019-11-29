%{
#include "y.tab.h"
int c;
extern int yylval;
%}
%%
"//".*\n ;          /* ignore comments */
[0-9]+				{yylval = atoi(yytext); return NUMBER;}
[a-hj-oq-z]     	{c = yytext[0];
           			 yylval = c - 'a';
           			 return(LETTER);
       				}
[ \t] ; 			/* ignore whitespace */
\n ;				/* ignore end of line */
[+-/*=pi]  return yytext[0];
%%