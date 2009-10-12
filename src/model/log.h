
#ifndef LOG_H
#define LOG_H

#include <string>
using std::string;

#include <vector>
using std::vector;

#include "module.h"
/**
 * class Log
 * 
 */

class Log
{
	private:
		int logID;
		vector<Module> modules;
		string shortName;
		string name;
		string description;
		string imagePath;
		string startDate;
		string endDate;
		bool show;
	public:

		/**
		 * Empty Constructor
		 */
		Log ( );

		/**
		 * Empty Destructor
		 */
		virtual ~Log ( );

		/**
		 * Set the value of logID
		 * \param new_var the new value of logID
		 */
		void setLogID ( int new_var );

		/**
		 * Get the value of logID
		 * \return the value of logID
		 */
		int getLogID ( );


		/**
		 * Set the value of modules
		 * \param new_var the new value of modules
		 */
		void setModules ( vector<Module> new_var );

		/**
		 * Get the value of modules
		 * \return the value of modules
		 */
		vector<Module> getModules ( );


		/**
		 * Set the value of shortName
		 * \param new_var the new value of shortName
		 */
		void setShortName ( string new_var );

		/**
		 * Get the value of shortName
		 * \return the value of shortName
		 */
		string getShortName ( );


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
		 * Set the value of description
		 * \param new_var the new value of description
		 */
		void setDescription ( string new_var );

		/**
		 * Get the value of description
		 * \return the value of description
		 */
		string getDescription ( );


		/**
		 * Set the value of imagePath
		 * \param new_var the new value of imagePath
		 */
		void setImagePath ( string new_var );

		/**
		 * Get the value of imagePath
		 * \return the value of imagePath
		 */
		string getImagePath ( );


		/**
		 * Set the value of startDate
		 * \param new_var the new value of startDate
		 */
		void setStartDate ( string new_var );

		/**
		 * Get the value of startDate
		 * \return the value of startDate
		 */
		string getStartDate ( );


		/**
		 * Set the value of endDate
		 * \param new_var the new value of endDate
		 */
		void setEndDate ( string new_var );

		/**
		 * Get the value of endDate
		 * \return the value of endDate
		 */
		string getEndDate ( );


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

#endif // LOG_H
