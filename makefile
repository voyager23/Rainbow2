# New makefile 02Apr2012

objects =  table_utils.o freduce.o fname_gen.o md5.o

deps = rainbow.h table_utils.h freduce.h fname_gen.h md5.h

objs = $(addprefix ./obj/, table_utils.o freduce.o fname_gen.o md5.o)

all : cmaketab csearch

cmaketab : $(objs)
	gcc -Wall -pthread -lm maketable_v7.c $^ -o ./bin/$@
	
csearch : $(objs)
	gcc -Wall -pthread -lm  searchtable_v7.c $^ -o ./bin/$@
	
#-----------------------------------------------------------------------

thisto : $(objs)
	gcc -Wall -lm thisto.c $^ -o ./bin/$@
	
new: $(objs)
	nvcc searchtable_v4.cu ./obj/freduce.o ./obj/table_utils.o ./obj/md5.o
	
#-----------------------------------------------------------------------
./obj/%.o : %.c $(deps)
	gcc -c $< -o $@
#-----------------------------------------------------------------------

