-- this script was written to test the foreign key an not null 
-- constraints

DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Module;

-- Module -------------------------------------------------------
CREATE TABLE Module
(modID INTEGER PRIMARY KEY AUTOINCREMENT,
modShortName VARCHAR (10) NOT NULL UNIQUE,
modName VARCHAR (30) NOT NULL UNIQUE,
modSingular VARCHAR (10) NOT NULL,
modPlural VARCHAR (10) NOT NULL,
modDescription VARCHAR (255),
modVersion INTEGER NOT NULL,
modImagePath VARCHAR (255),
modShow BOOL DEFAULT 1);

-- Location ----------------------------------------------------
CREATE TABLE Location
(locID INTEGER PRIMARY KEY AUTOINCREMENT,
locModID INTEGER ,
locName VARCHAR (30) NOT NULL UNIQUE,
locDescription VARCHAR (255),
locImagePath VARCHAR (255),
locShow BOOL DEFAULT 1,
FOREIGN KEY (locModID) REFERENCES Module(modID));

-- locModID triggers --------------------------------------------

-- Setting non null and use of triggers
/*
After testing as below, it appears that EITHER you set the field 
as NON NULL and then run the first version of the fki and fku OR 
you do not set the field as NON NULL and then manage it through 
the use of nni and nnu triggers in conjunction with the second 
fki and fku. However if you do allow null, then you would just  
use the first fki and fku triggers. 
As far as deleting goes, you use the first fkd trigger when you 
don't want the deletion to remove related records and you use the 
second fkd trigger where you want the related fields set to null.
*/

-- insert record ------------------------------------------------

-- if locModID is set as NON NULL and NULL is inserted a 'may not 
-- be null' messsage is raised.
-- if NULL is allowed, updating the locModID to null does not raise 
-- any errors
-- if locModID is updated to a non-existent modID then a foregin 
-- key error is raised whether the field is set to NOT NULL or not.

CREATE TRIGGER fki_1_locModID
	BEFORE INSERT ON Location
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Location" violates foreign key constraint "locModID"')
		WHERE  NEW.locModID IS NOT NULL
			AND  (SELECT modID FROM Module WHERE modID = new.locModID) IS NULL;
	END;


-- if the field is not set as NON NULL but nulls are not allowed, 
-- then this trigger is used.
-- if it is set to NON NULL then it is not always called and the fki 
-- is called instead
/*
CREATE TRIGGER nni_1_locModID
	BEFORE INSERT ON Location
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Location" violates NOT NULL constraint "locModID"')
		WHERE  NEW.locModID IS NULL;
	END;
*/

-- if a locModID is inserted as NULL a 'foreign key' messsage is 
-- raised whether the field is set to NOT NULL or not.
-- if a locModID is inserted as a non-existent modID then a foregin 
-- key error is raised whether the field is set to NOT NULL or not.
/*
CREATE TRIGGER fki_2_locModID
	BEFORE INSERT ON Location
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Location" violates foreign key constraint "locModID"')
		WHERE  (SELECT modID FROM Module WHERE modID = new.locModID) IS NULL;
	END;
*/

-- update record ------------------------------------------------

-- if locModID is set as NON NULL and it is updated to null, a 
-- 'may not be null' messsage is raised
-- if NULL is allowed, updating the locModID to null does not raise 
-- any errors
-- if locModID is updated to a non-existent modID then a foregin 
-- key error is raised whether the field is set to NOT NULL or not.
CREATE TRIGGER fku_1_locModID
	BEFORE UPDATE ON Location
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Location" violates foreign key constraint "locModID"')
		WHERE  NEW.locModID IS NOT NULL
			AND  (SELECT modID FROM Module WHERE modID = NEW.locModID) IS NULL;
	END;

-- if locModID is updated to NULL a 'foreign key' messsage is raised 
-- whether the field is set to NOT NULL or not.
-- if locModID is updated to a non-existent modID then a foregin key 
-- error is raised whether the field is set to NOT NULL or not.
/*
CREATE TRIGGER fku_2_locModID
	BEFORE UPDATE ON Location
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Location" violates foreign key constraint "locModID"')
		WHERE  (SELECT modID FROM Module WHERE modID = NEW.locModID) IS NULL;
	END;
*/

-- delete record ------------------------------------------------
-- without a deletion trigger the Module record is removed, but 
-- the modID remains in Location
-- if modID is NOT NULL it make no difference

-- this trigger does not allow the deletion of a Module record if a 
-- related Location record exists
CREATE TRIGGER fkd_1_locModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "locModID"')
		WHERE (SELECT locModID FROM Location WHERE locModID = OLD.modID) IS NOT NULL;
	END;

-- this trigger first removes all related records in Location before 
-- deleting the Module record
/*
CREATE TRIGGER fkd_2_locModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		DELETE from Location WHERE locModID = OLD.modID;
	END;
*/
-----------------------------------------------------------------
INSERT INTO Module (modID, modShortName, modName, modSingular, modPlural, modDescription, modVersion, modImagePath) 
	VALUES (1, 'NA', 'Not Applicable', 'NA', 'NA', 'This module is used where a module field is not applicable', 'NA', '');
INSERT INTO Module (modID, modShortName, modName, modSingular, modPlural, modDescription, modVersion, modImagePath) 
	VALUES (2, 'COW', 'Cattle Module', 'COW', 'cattle', 'This module enables the storage of cattle geneaology and related data', 'Cow_V1.01', '');
INSERT INTO Module (modID, modShortName, modName, modSingular, modPlural, modDescription, modVersion, modImagePath) 
	VALUES (95, 'VEG', 'Vegetable module', 'vegetable', 'vegetables', 'This module enables the storage of vegetable growing data', 'Veg_V1.01', '');

INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (51, 95, 'Front Yard', 'Lemon trees', '');
INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (52, 2, 'Side Garden', 'Watermelon patch', '');
INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (53, 1, 'Pot 1 on Verandah 1', 'Usually holds tomatoes', '');
INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (54, 2, 'Pot 2 on Verandah 1', 'Usually holds herbs', '');
INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (55, 1, 'Backyard', 'Usually pumpkins and zucchini', '');

-----------------------------------------------------------------
/*
select   'Module==>',
         modID, modShortName, modName, modSingular, modPlural,  
         modDescription, modVersion, modImagePath, modShow
from     Module
order by modName, modID;

select   'Location==>',
         locID, locID, locModID, locName, locDescription, 
         locImagePath, locShow
from     Location
order by locModID, locName, locID;
*/
-----------------------------------------------------------------
--delete from Module where modID = 95;

--update location set locModID = 99 where locID = 55;
--update location set locModID = NULL where locID = 55;
--update location set locModID = 95 where locID = 55;

--INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
--	VALUES (56, 99, 'Test', 'Test Insert', '');
--	VALUES (56, NULL, 'Test', 'Test Insert', '');
--	VALUES (56, 95, 'Test', 'Test Insert', '');

-----------------------------------------------------------------
select   'Module==>',
         modID, modShort, modName, modSingular, modPlural,  
         modDescription, modVersion, modImagePath, modShow
from     Module
order by modName, modID;

select   'Location==>',
         locID, locModID, locName, locDescription, 
         locImagePath, locShow
from     Location
order by locModID, locName, locID;

