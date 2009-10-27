
#ifndef MAJORTABLE_H
#define MAJORTABLE_H

#include <string>
using std::string;

#include "module.h"

/**
 * class MajorTable
 * 
 */

class MajorTable
{
	private:

		// Static Private attributes
		//  

		// Private attributes
		//  

		int mjrID;
		Module * module;
		string name;
		string description;
		string imagePath;
		bool show;
	public:
		/**
		 * Empty Constructor
		 */
		MajorTable();

		/**
		 * Empty Destructor
		 */
		virtual ~MajorTable();
		/**
		 * Set the value of mjrID
		 * \param new_var the new value of mjrID
		 */
		void setMjrID(const int new_var);

		/**
		 * Get the value of mjrID
		 * \return the value of mjrID
		 */
		int getMjrID();


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
		 * Set the value of description
		 * \param new_var the new value of description
		 */
		void setDescription(const string new_var);

		/**
		 * Get the value of description
		 * \return the value of description
		 */
		string getDescription();


		/**
		 * Set the value of imagePath
		 * \param new_var the new value of imagePath
		 */
		void setImagePath(const string new_var);

		/**
		 * Get the value of imagePath
		 * \return the value of imagePath
		 */
		string getImagePath();


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

typedef MajorTable Variety, Location, Source;
#endif // MAJORTABLE_H
