OBJS= cattlecontroller.o databasecontroller.o
CATTLE = cattlecontroller.cpp cattlecontroller.h
DATABASE = databasecontroller.cpp databasecontroller.h
CC=g++
INCLUDE_TAG= -I/usr/include/QtCore -I/usr/include/QtSql
COM_OPTS=-g -W $(INCLUDE_TAG)

all : $(OBJS)
	echo "Model successfully compiled"

cattlecontroller.o : $(CATTLE)
	$(CC) $(COM_OPTS) -c cattlecontroller.cpp

databasecontroller.o : $(DATABASE)
	$(CC) $(COM_OPTS) -c databasecontroller.cpp

###################
# CLEAN TARGET
###################

clean : 
	rm -f *.o
