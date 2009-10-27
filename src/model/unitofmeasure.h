
#ifndef UNITOFMEASURE_H
#define UNITOFMEASURE_H

#include <string>
using std::string;

#include "module.h"

/**
 * class UnitOfMeasure
 * 
 */

class UnitOfMeasure
{
	private:

		// Static Private attributes
		//  

		// Private attributes
		//  

		int unitOfMeasureID;
		Module * module;
		string shortName;
		string name;
		double minValue;
		double maxValue;
		bool show;
	public:

		/**
		 * Empty Constructor
		 */
		UnitOfMeasure();

		/**
		 * Empty Destructor
		 */
		virtual ~UnitOfMeasure();
		/**
		 * Set the value of unitOfMeasureID
		 * \param new_var the new value of unitOfMeasureID
		 */
		void setUnitOfMeasureID(const int new_var);

		/**
		 * Get the value of unitOfMeasureID
		 * \return the value of unitOfMeasureID
		 */
		int getUnitOfMeasureID();


		/**
		 * Set the value of module
		 * \param new_var the new value of module
		 */
		void setModule(Module * new_var);

		/**
		 * Get the value of module
		 * \return the value of module
		 */
		Module * getModule();


		/**
		 * Set the value of shortName
		 * \param new_var the new value of shortName
		 */
		void setShortName(const string new_var);

		/**
		 * Get the value of shortName
		 * \return the value of shortName
		 */
		string getShortName();


		/**
		 * Set the value of name
		 * \param new_var the new value of name
		 */
		void setName(const string new_var);

		/**
		 * Get the value of name
		 * \return the value of name
		 */
		string getName();


		/**
		 * Set the value of minValue
		 * \param new_var the new value of minValue
		 */
		void setMinValue(const double new_var);

		/**
		 * Get the value of minValue
		 * \return the value of minValue
		 */
		double getMinValue();


		/**
		 * Set the value of maxValue
		 * \param new_var the new value of maxValue
		 */
		void setMaxValue(const double new_var);

		/**
		 * Get the value of maxValue
		 * \return the value of maxValue
		 */
		double getMaxValue();


		/**
		 * Set the value of show
		 * \param new_var the new value of show
		 */
		void setShow(const bool new_var);

		/**
		 * Get the value of show
		 * \return the value of show
		 */
		bool getShow();

};

#endif // UNITOFMEASURE_H
