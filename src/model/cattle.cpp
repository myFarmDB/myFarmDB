#include "cattle.h"

#include "module.h"

#include "minortable.h"

Cattle::Cattle ( ) {
}

Cattle::~Cattle ( ) { }

void Cattle::setGender ( Gender * new_var ) {
			gender = new_var;
}

Gender * Cattle::getGender ( ) {
			return gender;
}

void Cattle::setHorn ( Horn * new_var ) {
			horn = new_var;
}

Horn * Cattle::getHorn ( ) {
			return horn;
}

void Cattle::setColour ( Colour * new_var ) {
			colour = new_var;
}

Colour * Cattle::getColour ( ) {
			return colour;
}

void Cattle::setMother ( CattleType new_var ) {
			mother = new_var;
}

CattleType Cattle::getMother ( ) {
			return mother;
}

void Cattle::setFather ( CattleType new_var ) {
			father = new_var;
}

CattleType Cattle::getFather ( ) {
			return father;
}

void Cattle::setTagNumber ( string new_var ) {
			tagNumber = new_var;
}

string Cattle::getTagNumber ( ) {
			return tagNumber;
}

void Cattle::setNLSTag ( string new_var ) {
			NLSTag = new_var;
}

string Cattle::getNLSTag ( ) {
			return NLSTag;
}
