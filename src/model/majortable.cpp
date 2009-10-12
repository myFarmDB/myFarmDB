#include "majortable.h"

#include "module.h"

// Constructors/Destructors
//  

MajorTable::MajorTable ( ) {
}

MajorTable::~MajorTable ( ) { }

void MajorTable::setMjrID ( int new_var ) {
			mjrID = new_var;
}

int MajorTable::getMjrID ( ) {
			return mjrID;
}

void MajorTable::setModule ( Module * new_var ) {
			module = new_var;
}

Module * MajorTable::getModule ( ) {
			return module;
}

void MajorTable::setName ( string new_var ) {
			name = new_var;
}

string MajorTable::getName ( ) {
			return name;
}

void MajorTable::setDescription ( string new_var ) {
			description = new_var;
}

string MajorTable::getDescription ( ) {
			return description;
}

void MajorTable::setImagePath ( string new_var ) {
			imagePath = new_var;
}

string MajorTable::getImagePath ( ) {
			return imagePath;
}

void MajorTable::setShow ( bool new_var ) {
			show = new_var;
}

bool MajorTable::getShow ( ) {
			return show;
}
