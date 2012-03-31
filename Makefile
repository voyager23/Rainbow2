# Makefile 24Jan2012

objdir = ./obj/
bindir = ./bin/

objects =  $(objdir)table_utils.o $(objdir)freduce.o $(objdir)fname_gen.o md5.o
deps = rainbow.h table_utils.h freduce.h fname_gen.h md5.h

all : cmaketab csearch7 csearch6 thisto

cmaketab : $(objdir)maketable_v7.o $(objects)
	gcc -pthread -o $(bindir)cmaketab -lm $(objdir)maketable_v7.o $(objects)

csearch6 : $(objdir)searchtable_v6.o $(objects)
	gcc -pthread -o $(bindir)csearch6 -lm $(objdir)searchtable_v6.o $(objects)
	
csearch7 : $(objdir)searchtable_v7.o $(objects)
	gcc -Wall -pthread -o $(bindir)csearch7 -lm $(objdir)searchtable_v7.o $(objects)

thisto : $(objects)
	gcc -Wall -o $(bindir)thisto -lm thisto.c $(objects)

#------------------------------------------------------------
csearch4 : searchtable_v4.o $(objects)
	gcc -o csearch4 -lm searchtable_v4.o $(objects)
	
csearch5 : searchtable_v5.o $(objects)
	gcc -o csearch5 -lm searchtable_v5.o $(objects)
	
pxt_mktab : pthread_01.o $(objects)
	gcc -pthread -o pxt_mktab -lm pthread_01.o $(objects)

#--------------------------------------------------------
pthread_01.o : pthread_01.c $(deps)
	gcc -pthread -c pthread_01.c
	
maketable_v4.o : $(deps)
maketable_v5.o : $(deps)
maketable_v6.0 : $(deps)
maketable_v7.0 : $(deps)

searchtable_v4.o : $(deps)
searchtable_v5.o : $(deps)
searchtable_v6.o : $(deps)
searchtable_v7.o : $(deps)

$(objdir)table_utils.o : $(deps)
$(objdir)freduce.o : $(deps)
$(objdir)fname_gen : $(deps)
$(objdir)md5.o : $(deps)

.PHONY : clean run

clean :
	rm *.o
run :
	./cmaketab
	./csearch7
	
