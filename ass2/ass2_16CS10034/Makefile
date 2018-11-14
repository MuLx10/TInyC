# MakeFile

a.out: main.o libass2_16CS10034.a
	gcc main.o -L. -lass2_16CS10034

main.o: main.c myl.h
	gcc  -c main.c

libass2_16CS10034.a: ass2_16CS10034.o
	ar -rcs libass2_16CS10034.a ass2_16CS10034.o
	

ass2_16CS10034.o: ass2_16CS10034.c myl.h
	gcc  -c ass2_16CS10034.c

clean:
	rm a.out main.o libass2_16CS10034.a ass2_16CS10034.o