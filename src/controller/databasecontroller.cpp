#include "databasecontroller.h"
#include "../exception/sqlexception.h"

#include <QtSql>

#include <string>
using std::string;

#include <iostream>
using std::cerr;
using std::endl;

DatabaseController::DatabaseController(const string databaseName)
{
   db = QSqlDatabase::addDatabase("QSQLITE");

   db.setDatabaseName(QString(databaseName.c_str()));

   db.open();

   try
   {
      checkErrors(db.lastError());
   }
   catch (SQLException e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      db.rollback();

      throw e;
   }
}

DatabaseController::~DatabaseController()
{
   db.close();
}

int DatabaseController::insertStatement(const string query)
{
   db.transaction();
   QSqlQuery command;

   command.exec(QString(query.c_str()));

   try
   {
      checkErrors(command.lastError());
   }
   catch (SQLException e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      db.rollback();

      throw e;
   }

   db.commit();

   return command.lastInsertId().toInt();
}

int DatabaseController::updateStatement(const string query)
{
   db.transaction();
   QSqlQuery command;

   command.exec(QString(query.c_str()));

   try
   {
      checkErrors(command.lastError());
   }
   catch (SQLException e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      db.rollback();

      throw e;
   }

   db.commit();

   return command.numRowsAffected();
}
int DatabaseController::deleteStatement(const string query)
{
   db.transaction();
   QSqlQuery command;

   command.exec(QString(query.c_str()));

   try
   {
      checkErrors(command.lastError());
   }
   catch (SQLException e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      db.rollback();

      throw e;
   }

   db.commit();

   return command.numRowsAffected();
}

QSqlQuery DatabaseController::selectQuery(const string query)
{
   db.transaction();
   QSqlQuery command;

   command.exec(QString(query.c_str()));

   if (! command.isSelect())
   {
      db.rollback();
      throw SQLException("Not a select query!");
   }

   try
   {
      checkErrors(command.lastError());
   }
   catch (SQLException e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      db.rollback();

      throw e;
   }

   db.commit();

   return command;
}

void DatabaseController::checkErrors(const QSqlError error)
{
   if (error.type() == QSqlError::NoError)
      return;

   if (error.type() == QSqlError::StatementError || error.type() == QSqlError::TransactionError || error.type() == QSqlError::UnknownError)
      throw SQLException(error.text().toStdString());
}
