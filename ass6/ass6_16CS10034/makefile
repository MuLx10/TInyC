asmGenerate: out
	./out 1 > ass6_16CS10034_quads1.out
	./out 2 > ass6_16CS10034_quads2.out
	./out 3 > ass6_16CS10034_quads3.out
	./out 4 > ass6_16CS10034_quads4.out
	./out 5 > ass6_16CS10034_quads5.out

out: lex.yy.o y.tab.o ass6_16CS10034_translator.o ass6_16CS10034_target_translator.o
	g++   lex.yy.o y.tab.o ass6_16CS10034_translator.o \
	ass6_16CS10034_target_translator.o -o out

ass6_16CS10034_target_translator.o: ass6_16CS10034_target_translator.cxx
	g++ -c  ass6_16CS10034_target_translator.cxx

ass6_16CS10034_translator.o: ass6_16CS10034_translator.cxx ass6_16CS10034_translator.h
	g++ -c  ass6_16CS10034_translator.h
	g++ -c  ass6_16CS10034_translator.cxx

lex.yy.o: lex.yy.c
	g++ -c lex.yy.c

y.tab.o: y.tab.c
	g++  -c y.tab.c

lex.yy.c: ass6_16CS10034.l y.tab.h ass6_16CS10034_translator.h
	flex ass6_16CS10034.l

y.tab.c: ass6_16CS10034.y
	yacc -dtv ass6_16CS10034.y

y.tab.h: ass6_16CS10034.y
	yacc -dtv ass6_16CS10034.y
	
clean:
	rm lex.yy.c y.tab.c y.tab.h lex.yy.o y.tab.o ass6_16CS10034_translator.o test1 test2 test3 test4 test5 y.output out ass6_16CS10034_target_translator.o libass2_16CS10034.a ass6_16CS10034_1.o ass2_16CS10034.o ass6_16CS10034_2.o ass6_16CS10034_3.o ass6_16CS10034_4.o ass6_16CS10034_5.o ass6_16CS10034_translator.h.gch


#Test files

test :
	make test1
	make test2
	make test3
	make test4
	make test5
	
test1: ass6_16CS10034_1.o libass2_16CS10034.a
	gcc ass6_16CS10034_1.o -o test1 -L. -lass2_16CS10034
ass6_16CS10034_1.o: myl.h
	gcc -c ass6_16CS10034_1.s

test2: ass6_16CS10034_2.o libass2_16CS10034.a
	gcc ass6_16CS10034_2.o -o test2 -L. -lass2_16CS10034
ass6_16CS10034_2.o: myl.h
	gcc -Wall -c ass6_16CS10034_2.s

test3: ass6_16CS10034_3.o libass2_16CS10034.a
	gcc ass6_16CS10034_3.o -o test3 -L. -lass2_16CS10034
ass6_16CS10034_3.o: myl.h
	gcc -Wall -c ass6_16CS10034_3.s

test4: ass6_16CS10034_4.o libass2_16CS10034.a
	gcc ass6_16CS10034_4.o -o test4 -L. -lass2_16CS10034
ass6_16CS10034_4.o: myl.h
	gcc -Wall -c ass6_16CS10034_4.s

test5: ass6_16CS10034_5.o libass2_16CS10034.a
	gcc ass6_16CS10034_5.o -o test5 -L. -lass2_16CS10034
ass6_16CS10034_5.o: myl.h
	gcc -Wall -c ass6_16CS10034_5.s


libass2_16CS10034.a: ass2_16CS10034.o
	ar -rcs libass2_16CS10034.a ass2_16CS10034.o

ass2_16CS10034.o: ass2_16CS10034.c myl.h
	gcc -Wall -c ass2_16CS10034.c
