
#ifndef ACTIVITY_H
#define ACTIVITY_H

#include <string>
using std::string;

#include "module.h"

/**
 class Activity
 
 */
class Activity
{
	private:
		int activityID;
		Module module;
		string name;
		string description;
		bool hasMeasurement;
		bool show;
	public:
		/**
		 Empty Constructor
		 */
		Activity();

		/**
		 Empty Destructor
		 */
		virtual ~Activity();
		/**
		 Set the value of activityID
		 \param new_var the new value of activityID
		 */
		void setActivityID(const int new_var);

		/**
		 Get the value of activityID
		 \return the value of activityID
		 */
		int getActivityID();


		/**
		 Set the value of module
		 \param new_var the new value of module
		 */
		void setModule(Module new_var);

		/**
		 Get the value of module
		 \return the value of module
		 */
		Module getModule();

		/**
		 Set the value of name
		 \param new_var the new value of name
		 */
		void setName(string new_var);

		/**
		 Get the value of name
		 \return the value of name
		 */
		string getName();

		/**
		 Set the value of description
		 \param new_var the new value of description
		 */
		void setDescription(string new_var);

		/**
		 Get the value of description
		 \return the value of description
		 */
		string getDescription();

		/**
		 Set the value of hasMeasurement
		 \param new_var the new value of hasMeasurement
		 */
		void setHasMeasurement(const bool new_var);

		/**
		 Get the value of hasMeasurement
		 \return the value of hasMeasurement
		 */
		bool getHasMeasurement();

		/**
		 Set the value of show
		 \param new_var the new value of show
		 */
		void setShow(const bool new_var);

		/**
		 Get the value of show
		 \return the value of show
		 */
		bool getShow();
};

#endif // ACTIVITY_H
