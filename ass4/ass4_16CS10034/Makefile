test.txt: a.out ass4_16CS10034_test.c
	./a.out 0 < ass4_16CS10034_test.c > test.txt 2>&1
# ./a.out [0 for parser/1 for lexer] ass4_16CS10034_test.c > test.txt 2>&1
# 0 for parser
# 1 for lexer

a.out: lex.yy.c y.tab.c ass4_16CS10034_main.o
	gcc lex.yy.c y.tab.c ass4_16CS10034_main.o -lfl

lex.yy.c: ass3_16CS10034.l
	flex ass3_16CS10034.l

y.tab.c: ass4_16CS10034.y
	yacc -dtv ass4_16CS10034.y

ass4_16CS10034_main.o: ass4_16CS10034_main.c
	gcc -c ass4_16CS10034_main.c

clean:
	rm y.tab.c y.tab.h a.out lex.yy.c y.output ass4_16CS10034_main.o test.txt 