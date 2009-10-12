
#ifndef MINORTABLE_H
#define MINORTABLE_H

#include <string>
using std::string;

#include "module.h"
/**
 * class MinorTable
 * 
 */

class MinorTable
{
	private:
		int minorID;
		Module * module;
		string name;
		bool show;
	public:
		/**
		 * Empty Constructor
		 */
		MinorTable ( );

		/**
		 * Empty Destructor
		 */
		virtual ~MinorTable ( );
		/**
		 * Set the value of minorID
		 * \param new_var the new value of minorID
		 */
		void setMinorID ( int new_var );

		/**
		 * Get the value of minorID
		 * \return the value of minorID
		 */
		int getMinorID ( );

		/**
		 * Set the value of module
		 * \param new_var the new value of module
		 */
		void setModule ( Module * new_var );

		/**
		 * Get the value of module
		 * \return the value of module
		 */
		Module * getModule ( );

		/**
		 * Set the value of name
		 * \param new_var the new value of name
		 */
		void setName ( string new_var );

		/**
		 * Get the value of name
		 * \return the value of name
		 */
		string getName ( );

		/**
		 * Set the value of show
		 * \param new_var the new value of show
		 */
		void setShow ( bool new_var );

		/**
		 * Get the value of show
		 * \return the value of show
		 */
		bool getShow ( );
};

typedef MinorTable Horn, Gender, Colour;
#endif // MINORTABLE_H
