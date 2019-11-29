%{
#include <stdio.h>
#include <stdlib.h>

int reg[26];
int valid[26];
extern FILE *yyin;
%}

%token LETTER NUMBER
%left '+' '-'
%left '*' '/'
%%

start : statement						
      | statement start					
      ;

statement: LETTER '=' expression		{ reg[$1] = $3;}
 | 'p' LETTER							{ if(valid[$2] == 0) yyerror("syntax error"); else printf("%d\n", reg[$2]);}
 | 'i' LETTER							{ valid[$2] = 1;}
 |	expression							
 ;

expression: expression '+' expression   { $$ = $1 + $3;}
 | expression '-' expression        	{ $$ = $1 - $3;}
 | expression '*' expression			{ $$ = $1 * $3;}
 | expression '/' expression			{ if($3 == 0) yyerror("syntax error"); else $$ = $1 / $3;}
 | NUMBER                           	{ $$ = $1;}
 | LETTER								{ $$ = reg[$1];}
 ;
%%


int main(argc,argv) 
int argc ;
char **argv;
{
	if (argc > 1) {
		FILE *file;

		file = fopen(argv[1], "r" ) ;
		if (!file) {
			fprintf(stderr,"could not open %s\n",argv[1]);
			exit(1);
		}
		yyin = file;
	}
	do {
		yyparse();
	} while (!feof(yyin));
	return 0;
}

int yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}
int yywrap()
{
  return(1);
}