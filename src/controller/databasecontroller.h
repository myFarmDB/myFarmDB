#ifndef DATABASECONTROLLER_H
#define DATABASECONTROLLER_H
#include <QtSql>

#include <string>
using std::string;

class DatabaseController
{

public:
   DatabaseController(const string databaseName);
   ~DatabaseController();

   /**
      Insert data into the database. A successful query results in a commit, but if an exception is thrown, the database is rolled back.
      \param query the data to insert
      \exception SQLException is thrown if any errors are found in syntax or database errors occur.
      \return the id of the last insert done.
      */
   int insertStatement(const string query);

   /**
      Insert data into the database. A successful query results in a commit, but if an exception is thrown, the database is rolled back.
      \param query the data to update
      \exception SQLException is thrown if any errors are found in syntax or database errors occur.
      \return the number of rows affected
      */
   int updateStatement(const string query);

   /**
      Delete data from the database. A successful query results in a commit, but if an exception is thrown, the database is rolled back.
      \param error the error to check, if any
      \exception SQLException is thrown if any errors are found in syntax or database errors occur.
      \return the number of rows affected
      */
   int deleteStatement(const string query);
   /**
      Select data from the database. A successful query results in a commit, but if an exception is thrown, the database is rolled back.
      \param error the error to check, if any
      \exception SQLException is thrown if any errors are found in syntax or database errors occur.
      \return a QSqlQuery object to navigate the results
      \warning This is dangerous, but much simplier than writing my own result set class.
      */
   QSqlQuery selectQuery(const string query);

private:
   QSqlDatabase db;
   void checkErrors(const QSqlError error);

};

#endif // DATABASECONTROLLER_H
