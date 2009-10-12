#include "log.h"

#include <vector>
using std::vector;

// Constructors/Destructors
//  

Log::Log ( ) {
}

Log::~Log ( ) { }

void Log::setLogID ( int new_var ) {
			logID = new_var;
}

int Log::getLogID ( ) {
			return logID;
}

void Log::setModules ( vector<Module> new_var ) {
			modules = new_var;
}

vector<Module> Log::getModules ( ) {
			return modules;
}

void Log::setShortName ( string new_var ) {
			shortName = new_var;
}

string Log::getShortName ( ) {
			return shortName;
}

void Log::setName ( string new_var ) {
			name = new_var;
}

string Log::getName ( ) {
			return name;
}

void Log::setDescription ( string new_var ) {
			description = new_var;
}

string Log::getDescription ( ) {
			return description;
}

void Log::setImagePath ( string new_var ) {
			imagePath = new_var;
}

string Log::getImagePath ( ) {
			return imagePath;
}

void Log::setStartDate ( string new_var ) {
			startDate = new_var;
}

string Log::getStartDate ( ) {
			return startDate;
}

void Log::setEndDate ( string new_var ) {
			endDate = new_var;
}

string Log::getEndDate ( ) {
			return endDate;
}

void Log::setShow ( bool new_var ) {
			show = new_var;
}

bool Log::getShow ( ) {
			return show;
}

