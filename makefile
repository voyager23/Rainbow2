# New makefile 02Apr2012

objects =  table_utils.o freduce.o fname_gen.o md5.o
deps = rainbow.h table_utils.h freduce.h fname_gen.h md5.h

find_obj = $(addprefix ./obj/, table_utils.o freduce.o fname_gen.o md5.o)

all : cmaketab csearch

csearch : $(find_obj)
	gcc -Wall -pthread -lm  searchtable_v7.c $^ -o ./bin/$@

thisto : $(find_obj)
	gcc -Wall -lm thisto.c $^ -o ./bin/$@
	
cmaketab : $(find_obj)
	gcc -Wall -pthread -lm maketable_v7.c $^ -o ./bin/$@
	

	
./obj/%.o : %.c $(deps)
	gcc -c $< -o $@
