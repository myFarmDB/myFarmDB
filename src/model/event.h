
#ifndef EVENT_H
#define EVENT_H

#include <string>
using std::string;

#include "majortable.h"

#include "module.h"
#include "log.h"
#include "unitofmeasure.h"
#include "activity.h"
/**
 class Event
 
 */

class Event
{
	private:
		int eventID;
		Module module;
		Log log;
		Activity activity;
		Location location;
		UnitOfMeasure unitOfMeasure;
		double measurementValue;
		string dateOccured;
		string imagePath;
		string notes;
		bool show;
	public:
		/**
		 Empty Constructor
		 */
		Event ();

		/**
		 Empty Destructor
		 */
		virtual ~Event ();
		/**
		 Set the value of eventID
		 \param new_var the new value of eventID
		 */
		void setEventID(const int new_var);

		/**
		 Get the value of eventID
		 \return the value of eventID
		 */
		int getEventID ();


		/**
		 Set the value of module
		 \param new_var the new value of module
		 */
		void setModule(Module new_var);

		/**
		 Get the value of module
		 \return the value of module
		 */
		Module getModule ();


		/**
		 Set the value of log
		 \param new_var the new value of log
		 */
		void setLog(Log new_var);

		/**
		 Get the value of log
		 \return the value of log
		 */
		Log getLog ();


		/**
		 Set the value of activity
		 \param new_var the new value of activity
		 */
		void setActivity(Activity new_var);

		/**
		 Get the value of activity
		 \return the value of activity
		 */
		Activity getActivity ();


		/**
		 Set the value of location
		 \param new_var the new value of location
		 */
		void setLocation(Location new_var);

		/**
		 Get the value of location
		 \return the value of location
		 */
		Location getLocation ();


		/**
		 Set the value of unitOfMeasure
		 \param new_var the new value of unitOfMeasure
		 */
		void setUnitOfMeasure(UnitOfMeasure new_var);

		/**
		 Get the value of unitOfMeasure
		 \return the value of unitOfMeasure
		 */
		UnitOfMeasure getUnitOfMeasure ();


		/**
		 Set the value of measurementValue
		 \param new_var the new value of measurementValue
		 */
		void setMeasurementValue(const double new_var);

		/**
		 Get the value of measurementValue
		 \return the value of measurementValue
		 */
		double getMeasurementValue ();


		/**
		 Set the value of dateOccured
		 \param new_var the new value of dateOccured
		 */
		void setDateOccured(const string new_var);

		/**
		 Get the value of dateOccured
		 \return the value of dateOccured
		 */
		string getDateOccured ();


		/**
		 Set the value of imagePath
		 \param new_var the new value of imagePath
		 */
		void setImagePath(const string new_var);

		/**
		 Get the value of imagePath
		 \return the value of imagePath
		 */
		string getImagePath ();


		/**
		 Set the value of notes
		 \param new_var the new value of notes
		 */
		void setNotes(const string new_var);

		/**
		 Get the value of notes
		 \return the value of notes
		 */
		string getNotes ();


		/**
		 Set the value of show
		 \param new_var the new value of show
		 */
		void setShow(const bool new_var);

		/**
		 Get the value of show
		 \return the value of show
		 */
		bool getShow ();
};

#endif // EVENT_H
