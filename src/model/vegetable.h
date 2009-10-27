
#ifndef VEGETABLE_H
#define VEGETABLE_H
#include "entity.h"

#include <string>
using std::string;

#include "unitofmeasure.h"

/**
 * class Vegetable
 * 
 */

class Vegetable : public Entity
{
	private:
		UnitOfMeasure * unitOfMeasure;
		int maxValue;
		int minValue;
	public:
		/**
		 * Empty Constructor
		 */
		Vegetable();

		/**
		 * Empty Destructor
		 */
		virtual ~Vegetable();
		/**
		 * Set the value of unitOfMeasure
		 * \param new_var the new value of unitOfMeasure
		 */
		void setUnitOfMeasure(UnitOfMeasure * new_var);

		/**
		 * Get the value of unitOfMeasure
		 * \return the value of unitOfMeasure
		 */
		UnitOfMeasure * getUnitOfMeasure();


		/**
		 * Set the value of maxValue
		 * \param new_var the new value of maxValue
		 */
		void setMaxValue(const int new_var);

		/**
		 * Get the value of maxValue
		 * \return the value of maxValue
		 */
		int getMaxValue();


		/**
		 * Set the value of minValue
		 * \param new_var the new value of minValue
		 */
		void setMinValue(const int new_var);

		/**
		 * Get the value of minValue
		 * \return the value of minValue
		 */
		int getMinValue();

};

#endif // VEGETABLE_H
