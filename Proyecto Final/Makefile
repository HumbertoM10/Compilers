all:
	lex emoji.l 
	yacc -d emoji.y
	gcc y.tab.c lex.yy.c -ly -lfl -o translate
