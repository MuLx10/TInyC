test_out.txt: a.out ass3_16CS10034_test.c
	./a.out < ass3_16CS10034_test.c > test_out.txt

a.out: lex.yy.c y.tab.c ass3_16CS10034.o
	gcc lex.yy.c y.tab.c ass3_16CS10034.o -lfl 2>/dev/null

lex.yy.c: ass3_16CS10034.l
	flex ass3_16CS10034.l 2>/dev/null

y.tab.c: ass3_16CS10034.y
	yacc -dtv ass3_16CS10034.y 2>/dev/null

ass3_16CS10034.o: ass3_16CS10034.c
	gcc -c ass3_16CS10034.c 2>/dev/null
	

clean:
	rm y.tab.c y.tab.h a.out lex.yy.c y.output ass3_16CS10034.o test_out.txt 2>/dev/null