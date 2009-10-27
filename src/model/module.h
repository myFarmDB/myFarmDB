
#ifndef MODULE_H
#define MODULE_H

#include <string>
using std::string;

#include "module.h"
/**
 * class Module
 * 
 */

class Module
{
	private:

		// Static Private attributes
		//  

		// Private attributes
		//  

		int moduleID;
		string shortName;
		string name;
		string description;
		string imagePath;
		string singularEntityName;
		string pluralEntityName;
		string versionNumber;
		bool show;
	public:

		/**
		 * Empty Constructor
		 */
		Module();

		/**
		 * Empty Destructor
		 */
		virtual ~Module();
		/**
		 * Set the value of moduleID
		 * \param new_var the new value of moduleID
		 */
		void setModuleID(const int new_var);

		/**
		 * Get the value of moduleID
		 * \return the value of moduleID
		 */
		int getModuleID();


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
		 * Set the value of singularEntityName
		 * \param new_var the new value of singularEntityName
		 */
		void setSingularEntityName(const string new_var);

		/**
		 * Get the value of singularEntityName
		 * \return the value of singularEntityName
		 */
		string getSingularEntityName();


		/**
		 * Set the value of pluralEntityName
		 * \param new_var the new value of pluralEntityName
		 */
		void setPluralEntityName(const string new_var);

		/**
		 * Get the value of pluralEntityName
		 * \return the value of pluralEntityName
		 */
		string getPluralEntityName();


		/**
		 * Set the value of versionNumber
		 * \param new_var the new value of versionNumber
		 */
		void setVersionNumber(const string new_var);

		/**
		 * Get the value of versionNumber
		 * \return the value of versionNumber
		 */
		string getVersionNumber();


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

#endif // MODULE_H
