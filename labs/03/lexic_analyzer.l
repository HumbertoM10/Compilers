%%
p { printf("print"); }
float |
f { printf("floatdcl"); }
int |
i { printf("intdcl"); }

[a-z][a-zA-Z]* { printf("id"); }
[1-9][0-9]* |
[0] { printf("inum"); }
[1-9][0-9]*[.][0-9]*[1-9] |
0[.]0 |
0[.][0-9]*[1-9] { printf("fnum"); }

\= { printf("assign"); }
\+ { printf("plus"); }
%%

main ( ){
	yylex();
}