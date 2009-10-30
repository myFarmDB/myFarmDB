#include "vegetable.h"

#include "module.h"

// Constructors/Destructors
//  

Vegetable::Vegetable()
{
}

Vegetable::~Vegetable()
{ }

void Vegetable::setUnitOfMeasure(UnitOfMeasure new_var)
{
			unitOfMeasure = new_var;
}

UnitOfMeasure Vegetable::getUnitOfMeasure()
{
			return unitOfMeasure;
}

void Vegetable::setMaxValue(const int new_var)
{
			maxValue = new_var;
}

int Vegetable::getMaxValue()
{
			return maxValue;
}

void Vegetable::setMinValue(const int new_var)
{
			minValue = new_var;
}

int Vegetable::getMinValue()
{
			return minValue;
}

