#include "listclass.h"

#include <string>
using std::string;

string ListClass::getName()
{
	return name;
}

int ListClass::getID()
{
	return id;
}

void ListClass::setID(const int id)
{
	this->id = id;
}

void ListClass::setName(const string name)
{
	this->name = name;
}
