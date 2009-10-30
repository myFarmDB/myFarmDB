
#ifndef CATTLE_H
#define CATTLE_H
#include "entity.h"

#include <string>
using std::string;

#include "minortable.h"
#include "listclass.h"
/**
 class Cattle
 
 */

class Cattle : public Entity
{
	private:
		Gender gender;
		Horn horn;
		Colour colour;
		CattleType mother;
		CattleType father;
		string tagNumber;
		string NLSTag;
	public:

		/**
		 Empty Constructor
		 */
		Cattle();

		/**
		 Empty Destructor
		 */
		virtual ~Cattle();

		// Private attribute accessor methods
		//  


		/**
		 Set the value of gender
		 \param new_var the new value of gender
		 */
		void setGender(Gender new_var);

		/**
		 Get the value of gender
		 \return the value of gender
		 */
		Gender getGender();


		/**
		 Set the value of horn
		 \param new_var the new value of horn
		 */
		void setHorn(Horn new_var);

		/**
		 Get the value of horn
		 \return the value of horn
		 */
		Horn getHorn();


		/**
		 Set the value of colour
		 \param new_var the new value of colour
		 */
		void setColour(Colour new_var);

		/**
		 Get the value of colour
		 \return the value of colour
		 */
		Colour getColour();

		/**
		 Set the value of mother
		 \param new_var the new value of mother
		 */
		void setMother(const CattleType new_var);

		/**
		 Get the value of mother
		 \return the value of mother
		 */
		CattleType getMother();


		/**
		 Set the value of father
		 \param new_var the new value of father
		 */
		void setFather(const CattleType new_var);

		/**
		 Get the value of father
		 \return the value of father
		 */
		CattleType getFather();


		/**
		 Set the value of tagNumber
		 \param new_var the new value of tagNumber
		 */
		void setTagNumber(const string new_var);

		/**
		 Get the value of tagNumber
		 \return the value of tagNumber
		 */
		string getTagNumber();


		/**
		 Set the value of NLSTag
		 \param new_var the new value of NLSTag
		 */
		void setNLSTag(const string new_var);

		/**
		 Get the value of NLSTag
		 \return the value of NLSTag
		 */
		string getNLSTag();
};

#endif // CATTLE_H
