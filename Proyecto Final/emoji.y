%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *yyin;
%}

%union 
{
        char *string;
}

%token NOUN VERB NOT WAIT HEART HATE
%type<string> NOUN
%type<string> VERB
%type<string> WAIT
%type<string> HEART
%type<string> HATE

%%

start : statement						
      | statement start					
      ;

statement: word statement
 | word
;

word: NOT VERB					{printf("can't %s",$2);}
 | NOT WAIT	VERB				{printf("can't %s to %s",$2,$3);}
 | NOUN 						{printf("%s",$1);}
 | VERB 						{printf("%s",$1);}
 | NOT NOUN 					{printf("not %s",$2);}
 | WAIT VERB					{printf("%s to %s",$1,$2);}
 | HEART NOUN					{printf("love %s",$2);}
 | HEART VERB					{printf("love to %s",$2);}
 | HATE NOUN					{printf("%s %s",$1,$2);}
 | HATE VERB					{printf("%s to %s",$1,$2);}
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