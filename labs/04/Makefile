all:
	lex calc.l 
	yacc -d calc.y
	gcc y.tab.c lex.yy.c -ly -lfl -o calculator