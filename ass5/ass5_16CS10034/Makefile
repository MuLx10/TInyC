a.out: lex.yy.o y.tab.o ass5_16CS10034_translator.o
	g++ lex.yy.o y.tab.o ass5_16CS10034_translator.o -lfl

ass5_16CS10034_translator.o: ass5_16CS10034_translator.cxx ass5_16CS10034_translator.h
	g++ -c ass5_16CS10034_translator.h
	g++ -c ass5_16CS10034_translator.cxx

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

y.tab.o: y.tab.c
	g++ -c y.tab.c

lex.yy.c: ass5_16CS10034.l y.tab.h ass5_16CS10034_translator.h
	flex ass5_16CS10034.l

y.tab.c: ass5_16CS10034.y
	yacc -dtv ass5_16CS10034.y -W

y.tab.h: ass5_16CS10034.y
	yacc -dtv ass5_16CS10034.y -W

clean:
	rm lex.yy.c y.tab.c y.tab.h lex.yy.o y.tab.o ass5_16CS10034_translator.o y.output a.out

test: 
	./a.out < ass5_16CS10034_test.c
