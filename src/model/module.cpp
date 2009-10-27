#include "module.h"

// Constructors/Destructors
//  

Module::Module()
{
}

Module::~Module()
{ }

void Module::setModuleID(const int new_var)
{
			moduleID = new_var;
}

int Module::getModuleID()
{
			return moduleID;
}

void Module::setShortName(const string new_var)
{
			shortName = new_var;
}

string Module::getShortName()
{
			return shortName;
}

void Module::setName(const string new_var)
{
			name = new_var;
}

string Module::getName()
{
			return name;
}

void Module::setDescription(const string new_var)
{
			description = new_var;
}

string Module::getDescription()
{
			return description;
}

void Module::setImagePath(const string new_var)
{
			imagePath = new_var;
}

string Module::getImagePath()
{
			return imagePath;
}

void Module::setSingularEntityName(const string new_var)
{
			singularEntityName = new_var;
}

string Module::getSingularEntityName()
{
			return singularEntityName;
}

void Module::setPluralEntityName(const string new_var)
{
			pluralEntityName = new_var;
}

string Module::getPluralEntityName()
{
			return pluralEntityName;
}

void Module::setVersionNumber(const string new_var)
{
			versionNumber = new_var;
}

string Module::getVersionNumber()
{
			return versionNumber;
}

void Module::setShow(const bool new_var)
{
			show = new_var;
}

bool Module::getShow()
{
			return show;
}

