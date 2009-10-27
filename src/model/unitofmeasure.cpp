#include "unitofmeasure.h"

#include "module.h"



// Constructors/Destructors
//  

UnitOfMeasure::UnitOfMeasure()
{
}

UnitOfMeasure::~UnitOfMeasure()
{ }

void UnitOfMeasure::setUnitOfMeasureID(const int new_var)
{
			unitOfMeasureID = new_var;
}

int UnitOfMeasure::getUnitOfMeasureID()
{
			return unitOfMeasureID;
}

void UnitOfMeasure::setModule(Module * new_var)
{
			module = new_var;
}

Module * UnitOfMeasure::getModule()
{
			return module;
}

void UnitOfMeasure::setShortName(const string new_var)
{
			shortName = new_var;
}

string UnitOfMeasure::getShortName()
{
			return shortName;
}

void UnitOfMeasure::setName(const string new_var)
{
			name = new_var;
}

string UnitOfMeasure::getName()
{
			return name;
}

void UnitOfMeasure::setMinValue(const double new_var)
{
			minValue = new_var;
}

double UnitOfMeasure::getMinValue()
{
			return minValue;
}

void UnitOfMeasure::setMaxValue(const double new_var)
{
			maxValue = new_var;
}

double UnitOfMeasure::getMaxValue()
{
			return maxValue;
}

void UnitOfMeasure::setShow(const bool new_var)
{
			show = new_var;
}

bool UnitOfMeasure::getShow()
{
			return show;
}
