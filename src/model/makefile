OBJS=activity.o cattle.o entity.o event.o listclass.o log.o majortable.o minortable.o module.o unitofmeasure.o vegetable.o
ACTIVITY=activity.cpp activity.h
CATTLE=cattle.cpp cattle.h
ENTITY=entity.cpp entity.h
EVENT=event.cpp event.h
LISTCLASS=listclass.cpp listclass.h
LOG=log.cpp log.h
MAJORTABLE=majortable.cpp majortable.h
MINORTABLE=minortable.cpp minortable.h
MODULE=module.cpp module.h
UNITOFMEASURE=unitofmeasure.cpp unitofmeasure.h
VEGETABLE=vegetable.cpp vegetable.h
CC=g++
COM_OPTS=-g -W

all : $(OBJS)
	echo "Model successfully compiled"

activity.o : $(ACTIVITY)
	$(CC) $(COM_OPTS) -c activity.cpp

cattle.o : $(CATTLE)
	$(CC) $(COM_OPTS) -c cattle.cpp

entity.o : $(ENTITY)
	$(CC) $(COM_OPTS) -c entity.cpp

event.o : $(EVENT)
	$(CC) $(COM_OPTS) -c event.cpp

listclass.o : $(LISTCLASS)
	$(CC) $(COM_OPTS) -c listclass.cpp

log.o : $(LOG)
	$(CC) $(COM_OPTS) -c log.cpp

majortable.o : $(MAJORTABLE)
	$(CC) $(COM_OPTS) -c majortable.cpp

minortable.o : $(MINORTABLE)
	$(CC) $(COM_OPTS) -c minortable.cpp

module.o : $(MODULE)
	$(CC) $(COM_OPTS) -c module.cpp
	
unitofmeasure.o : $(UNITOFMEASURE)
	$(CC) $(COM_OPTS) -c unitofmeasure.cpp

vegetable.o : $(VEGETABLE)
	$(CC) $(COM_OPTS) -c vegetable.cpp

###################
# CLEAN TARGET
###################

clean : 
	rm -f *.o
