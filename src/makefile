all: models controllers views

models: 
	make -C model
	echo "Model successfully compiled"

controllers:
	make -C controller
	echo "Controllers successfully compiled"

views:
	make -C view
	echo "View successfully compiled"

###################
# CLEAN TARGET
###################

clean : 
	rm -f *.o
	make -C model clean
