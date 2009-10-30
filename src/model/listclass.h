#ifndef LISTCLASS_H
#define LISTCLASS_H
#include <string>
using std::string;

/**
 List class for displaying info in combo boxes, or where only basic info is needed
 */
class ListClass
{
	private:
		int id;
		string name;
	
	public:
		/**
		 get the name variable
		 \return the name
		 */
		string getName();
		/**
		 get the id variable
		 \return the id
		 */
		int getID();

		/**
		 set the id
		 \param id the new id
		 */
		void setID(const int id);

		/**
		 set the name
		 \param name the new name
		 */
		void setName(const string name);
};

typedef ListClass CattleType, ColourType, HornType, GenderType;

#endif
