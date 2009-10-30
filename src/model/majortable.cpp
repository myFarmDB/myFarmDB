#include "majortable.h"

#include "module.h"

// Constructors/Destructors
//  

MajorTable::MajorTable()
{
}

MajorTable::~MajorTable()
{ }

void MajorTable::setMjrID(const int new_var)
{
			mjrID = new_var;
}

int MajorTable::getMjrID()
{
			return mjrID;
}

void MajorTable::setModule(Module new_var)
{
			module = new_var;
}

Module MajorTable::getModule()
{
			return module;
}

void MajorTable::setName(const string new_var)
{
			name = new_var;
}

string MajorTable::getName()
{
			return name;
}

void MajorTable::setDescription(const string new_var)
{
			description = new_var;
}

string MajorTable::getDescription()
{
			return description;
}

void MajorTable::setImagePath(const string new_var)
{
			imagePath = new_var;
}

string MajorTable::getImagePath()
{
			return imagePath;
}

void MajorTable::setShow(const bool new_var)
{
			show = new_var;
}

bool MajorTable::getShow()
{
			return show;
}
