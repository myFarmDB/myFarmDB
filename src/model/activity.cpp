#include "activity.h"
#include "module.h"

Activity::Activity ( ) 
{

}

Activity::~Activity ( ) { }

void Activity::setActivityID ( int new_var ) {
			activityID = new_var;
}

int Activity::getActivityID ( ) {
			return activityID;
}

void Activity::setModule ( Module * new_var ) {
			module = new_var;
}

Module * Activity::getModule ( ) {
			return module;
}

void Activity::setName ( string new_var ) {
			name = new_var;
}

string Activity::getName ( ) {
			return name;
}

void Activity::setDescription ( string new_var ) {
			description = new_var;
}

string Activity::getDescription ( ) {
			return description;
}

void Activity::setHasMeasurement ( bool new_var ) {
			hasMeasurement = new_var;
}

bool Activity::getHasMeasurement ( ) {
			return hasMeasurement;
}

void Activity::setShow ( bool new_var ) {
			show = new_var;
}

bool Activity::getShow ( ) {
			return show;
}
