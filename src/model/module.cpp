#include "module.h"

// Constructors/Destructors
//  

Module::Module ( ) {
}

Module::~Module ( ) { }

void Module::setModuleID ( int new_var ) {
			moduleID = new_var;
}

int Module::getModuleID ( ) {
			return moduleID;
}

void Module::setShortName ( string new_var ) {
			shortName = new_var;
}

string Module::getShortName ( ) {
			return shortName;
}

void Module::setName ( string new_var ) {
			name = new_var;
}

string Module::getName ( ) {
			return name;
}

void Module::setDescription ( string new_var ) {
			description = new_var;
}

string Module::getDescription ( ) {
			return description;
}

void Module::setImagePath ( string new_var ) {
			imagePath = new_var;
}

string Module::getImagePath ( ) {
			return imagePath;
}

void Module::setSingularEntityName ( string new_var ) {
			singularEntityName = new_var;
}

string Module::getSingularEntityName ( ) {
			return singularEntityName;
}

void Module::setPluralEntityName ( string new_var ) {
			pluralEntityName = new_var;
}

string Module::getPluralEntityName ( ) {
			return pluralEntityName;
}

void Module::setVersionNumber ( string new_var ) {
			versionNumber = new_var;
}

string Module::getVersionNumber ( ) {
			return versionNumber;
}

void Module::setShow ( bool new_var ) {
			show = new_var;
}

bool Module::getShow ( ) {
			return show;
}

