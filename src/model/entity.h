
#ifndef ENTITY_H
#define ENTITY_H

#include <string>
using std::string;

#include <vector>
using std::vector;

#include "module.h"
#include "majortable.h"
#include "event.h"

/**
 class Entity
 
 */

class Entity
{
	private:
		int entityID;
		Module module;
		string name;
		string description;
		string imagePath;
		Variety variety;
		Location location;
		Source source;
		vector<Event> events;
		bool show;
	public:
		/**
		 Empty Constructor
		 */
		Entity ();

		/**
		 Empty Destructor
		 */
		virtual ~Entity ();
		/**
		 Set the value of entityID
		 \param new_var the new value of entityID
		 */
		void setEntityID(const int new_var);

		/**
		 Get the value of entityID
		 \return the value of entityID
		 */
		int getEntityID ();


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
		 Set the value of name
		 \param new_var the new value of name
		 */
		void setName(const string new_var);

		/**
		 Get the value of name
		 \return the value of name
		 */
		string getName ();


		/**
		 Set the value of description
		 \param new_var the new value of description
		 */
		void setDescription(const string new_var);

		/**
		 Get the value of description
		 \return the value of description
		 */
		string getDescription ();


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
		 Set the value of variety
		 \param new_var the new value of variety
		 */
		void setVariety(Variety new_var);

		/**
		 Get the value of variety
		 \return the value of variety
		 */
		Variety getVariety ();


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
		 Set the value of source
		 \param new_var the new value of source
		 */
		void setSource(Source new_var);

		/**
		 Get the value of source
		 \return the value of source
		 */
		Source getSource ();

		/**
		 Set the value of events
		 \param new_var the new value of events
		 */
		void setEvents(const vector<Event> new_var);

		/**
		 Get the value of events
		 \return the value of events
		 */
		vector<Event> getEvents ();

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

#endif // ENTITY_H
