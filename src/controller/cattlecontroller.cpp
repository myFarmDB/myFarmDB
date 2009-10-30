#include "../model/listclass.h"
#include "../model/cattle.h"
#include "cattlecontroller.h"
#include "../exception/sqlexception.h"


#include <QtSql>
#include <QtCore>

#include <vector>
using std::vector;

#include <iostream>
using std::cerr;
using std::endl;

Cattle CattleController::getSingleCattle(const int id)
{
   Cattle cow;

   string tagNumber;
   string NLSTag;
   string name;
   string description;
   string imagePath;
   int cowID;
   bool show;

   const QString getSingleCattleTemplate = "select cowID, cowTag, cowNlsTag, entName, entDescription, entImagePath, entShow from Cattle, Entity where entID = %1";

   QSqlQuery query;
   QSqlRecord record;

   const string getSingleCattleQuery = getSingleCattleTemplate.arg(id).toStdString();

   try
   {
      query = databaseController.selectQuery(getSingleCattleQuery);
      record = query.record();
   }
   catch (SQLException & e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      throw e;
   }

   query.first();

   name = query.value(record.indexOf("entName")).toString().toStdString();
   tagNumber = query.value(record.indexOf("cowTag")).toString().toStdString();
   NLSTag = query.value(record.indexOf("cowNlsTag")).toString().toStdString();
   description = query.value(record.indexOf("entDescription")).toString().toStdString();
   imagePath = query.value(record.indexOf("entImagePath")).toString().toStdString();
   show = query.value(record.indexOf("entShow")).toBool();

   bool ok;
   cowID = query.value(record.indexOf("cowID")).toInt(&ok);

   cow.setMother(getMother(cow));
   cow.setFather(getFather(cow));

   cow.setTagNumber(tagNumber);
   cow.setNLSTag(NLSTag);
   cow.setName(name);
   cow.setDescription(description);
   cow.setImagePath(imagePath);
   cow.setEntityID(cowID);

   cow.setShow(show);

#warning The controllers have to be implemented here still
	/**

   cow.setHorn(hornController.getHorn(cow));
   cow.setColour(colourController.getColour(cow));
   cow.setGender(genderController.getGender(cow));
   cow.setVariety(varietyController.getVariety(cow));
   cow.setLocation(locationController.getLocation(cow));
   cow.setSource(sourceController.getSource(cow));
   cow.setModule(moduleController.getModule(cow));
   cow.setEvents(eventController.getEvents(cow));
	*/

   query.clear();

   return cow;
}

vector<CattleType> CattleController::getCattle()
{
   vector<CattleType> cattleTypes;

   QSqlQuery query;

   const string strQuery = "select entID, entName from Entity";

   try
   {
      query = databaseController.selectQuery(strQuery);
   }
   catch (SQLException & e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      throw e;
   }

   bool ok;

   while (query.next())
   {
      CattleType newCattle;

      // the &ok is needed incase the value couldn't be converted. But seeing as SQLite handles the ID's, it will be fine not to check it.
      newCattle.setID(query.value(0).toInt(&ok));
      newCattle.setName(query.value(1).toString().toStdString());

      cattleTypes.push_back(newCattle);
   }

   return cattleTypes;
}

void CattleController::addCattle(Cattle & cow)
{
   /*
     BEGIN ENTITY MAPPING
     */
   const QString entityInsertTemplate = "INSERT INTO entity (entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath) VALUES (%1, %2, %3, %4, '%5', '%6', '%7')";

   int modID, varID, locID, srcID;
   string name, description, imagePath;

   modID = cow.getModule().getModuleID();
   varID = cow.getVariety().getMjrID();
   locID = cow.getLocation().getMjrID();
   srcID = cow.getSource().getMjrID();
   name = cow.getName();
   description = cow.getDescription();
   imagePath = cow.getImagePath();

   const string entityInsertStatement = entityInsertTemplate.arg(modID).arg(varID).arg(locID).arg(srcID).arg(QString(name.c_str())).arg(QString(description.c_str())).arg(QString(imagePath.c_str())).toStdString();
   // END ENTITY MAPPING

   // BEGIN COW MAPPING
   const QString cowInsertTemplate = "INSERT INTO cow (cowID, cowGdrID, cowHrnID, cowClrID, cowMotherentID, cowFatherentID, cowTag, cowNlsTag) VALUES (%1, %2, %3, %4, %5, %6, '%7', '%8')";

   int cowID, genderID, hornID, colourID, motherID, fatherID;
   string tag, NLISTag;

   cowID = cow.getEntityID();
   genderID = cow.getGender().getMinorID();
   hornID = cow.getHorn().getMinorID();
   colourID = cow.getColour().getMinorID();
   motherID = cow.getMother().getID();
   fatherID = cow.getFather().getID();

   tag = cow.getTagNumber();
   NLISTag = cow.getNLSTag();

   const string cowInsertStatement = cowInsertTemplate.arg(cowID).arg(genderID).arg(hornID).arg(colourID).arg(motherID).arg(fatherID).arg(QString(tag.c_str())).arg(QString(NLISTag.c_str())).toStdString();
   // END COW MAPPING

   try
   {
      cow.setEntityID(databaseController.insertStatement(entityInsertStatement));

      databaseController.insertStatement(cowInsertStatement);
   }
   catch (SQLException & e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      throw e;
   }

}

void CattleController::updateCattle(Cattle cow)
{
   // BEGIN ENTITY MAPPING
   const QString entityUpdateTemplate = "UPDATE entity (entModID = %1, entVarID = %2, entLocID = %3, entSrcID = %4, entName = '%5', entDescription = '%6', entImagePath = '%7') WHERE entID = %8";

   int modID, varID, locID, srcID, entID;
   string name, description, imagePath;

   modID = cow.getModule().getModuleID();
   varID = cow.getVariety().getMjrID();
   locID = cow.getLocation().getMjrID();
   srcID = cow.getSource().getMjrID();
   entID = cow.getEntityID();
   name = cow.getName();
   description = cow.getDescription();
   imagePath = cow.getImagePath();

   const string entityUpdateStatement = entityUpdateTemplate.arg(modID).arg(varID).arg(locID).arg(srcID).arg(QString(name.c_str())).arg(QString(description.c_str())).arg(QString(imagePath.c_str())).arg(entID).toStdString();
   // END ENTITY MAPPING

   // BEGIN COW MAPPING
   const QString cowUpdateTemplate = "UPDATE cow (cowGdrID = %1, cowHrnID = %2, cowClrID = %3, cowMotherentID = %4, cowFatherentID = %5, cowTag = '%6', cowNlsTag = '%7') where cowID = %8)";

   int cowID, genderID, hornID, colourID, motherID, fatherID;
   string tag, NLISTag;

   cowID = cow.getEntityID();
   genderID = cow.getGender().getMinorID();
   hornID = cow.getHorn().getMinorID();
   colourID = cow.getColour().getMinorID();
   motherID = cow.getMother().getID();
   fatherID = cow.getFather().getID();

   tag = cow.getTagNumber();
   NLISTag = cow.getNLSTag();

   const string cowUpdateStatement = cowUpdateTemplate.arg(genderID).arg(hornID).arg(colourID).arg(motherID).arg(fatherID).arg(QString(tag.c_str())).arg(QString(NLISTag.c_str())).arg(cowID).toStdString();
   // END COW MAPPING

   try
   {
      databaseController.updateStatement(entityUpdateStatement);
      databaseController.updateStatement(cowUpdateStatement);
   }
   catch (SQLException e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      throw e;
   }

}

void CattleController::deleteCattle(Cattle cow)
{
}

vector<CattleType> CattleController::getOffspring(Cattle cow)
{
   vector<CattleType> offspring;

   const QString selectTemplate = "select entName, entID from entity, cattle where entity.entID = cattle.cowID and cowmotherentid = %1 OR cowfatherentid = %1";

   int parentID = cow.getEntityID();

   const string selectQuery = selectTemplate.arg(parentID).toStdString();

   QSqlQuery query;
   QSqlRecord record;

   try
   {
      query = databaseController.selectQuery(selectQuery);
      record = query.record();
   }
   catch (SQLException & e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      throw e;
   }

	bool ok;

   while (query.next())
   {
      CattleType newCattle;

      // the &ok is needed incase the value couldn't be converted. But seeing as SQLite handles the ID's, it will be fine not to check it.
      newCattle.setID(query.value(0).toInt(&ok));
      newCattle.setName(query.value(1).toString().toStdString());

      offspring.push_back(newCattle);
   }

   return offspring;
}

CattleType CattleController::getMother(Cattle cow)
{
   CattleType mother;

   const QString selectTemplate = "select entID, entName from entity where entity.entID = (select select cowmotherentid from cattle where cowID = %1";

   const int cowID = cow.getEntityID();

   const string selectQuery = selectTemplate.arg(cowID).toStdString();

   QSqlQuery query;

   try
   {
      query = databaseController.selectQuery(selectQuery);
   }
   catch (SQLException & e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      throw e;
   }

   query.first();

   if (query.size() == 0)
      return mother;

   int id = query.value(0).toString().toInt();
   string name = query.value(1).toString().toStdString();

   mother.setID(id);
   mother.setName(name);

   return mother;
}

CattleType CattleController::getFather(Cattle cow)
{
   CattleType father;

   const QString selectTemplate = "select entID, entName from entity where entity.entID = (select select cowfatherentid from cattle where cowID = %1";

   const int cowID = cow.getEntityID();

   const string selectQuery = selectTemplate.arg(cowID).toStdString();

   QSqlQuery query;

   try
   {
      query = databaseController.selectQuery(selectQuery);
   }
   catch (SQLException & e)
   {
      cerr << "Exception caught at " << __FILE__ << ": " << __LINE__  << endl
            << e.what() << endl;

      throw e;
   }

   query.first();

   if (query.size() == 0)
      return father;

   int id = query.value(0).toInt();
   string name = query.value(1).toString().toStdString();

   father.setID(id);
   father.setName(name);

   return father;
}
