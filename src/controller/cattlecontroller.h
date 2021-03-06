#include <vector>
using std::vector;

#include "../model/listclass.h"
#include "../model/cattle.h"
#include "databasecontroller.h"
/// A controller class for handling cattle in the database
/// The handling of NULL values needs to be added
class CattleController
{
	public:
		/// Default contructor
		CattleController();
		/// Destructor method
		~CattleController();

		/**
		Get a single cattle by id
		\param id the id to search on
		\return the cattle that was found. If the id of the returned cattle is zero, it wasn't found
		*/
		Cattle getSingleCattle(const int id);

		/**
		Get a simple list of all cattle in the database
		\return a vector of CattleTypes
		*/
		vector<CattleType> getCattle();

		/**
      Save a bovine back to the database. It is passed by reference as it's ID is set to the ID generated by the database
		\param cow the cow to write back to the database
		\todo ADD ALL THE EXCEPTIONS THROWN
		*/
      void addCattle(Cattle & cow);

		/**
		update an existing bovine in the database
		\param cow the cow to update in the database
		\todo ADD ALL THE EXCEPTIONS THROWN
		*/
		void updateCattle(Cattle cow);

		/**
		delete a bovine from the database
		\param cow the cow to delete from the database
		\todo ADD ALL THE EXCEPTIONS THROWN
		*/
		void deleteCattle(Cattle cow);

		/**
		Get all the offspring of a cow
		\param cow the cow to write back to the database
		\todo ADD ALL THE EXCEPTIONS THROWN
		*/
		vector<CattleType> getOffspring(Cattle cow);

	private:
		CattleType getMother(Cattle cow);
		CattleType getFather(Cattle cow);
		DatabaseController databaseController;

};
