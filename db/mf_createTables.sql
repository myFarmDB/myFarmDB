--drop database myFarm;
--create database if not exists myFarm;
--use myFarm;

DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Activity;
DROP TABLE IF EXISTS Vegetable;
DROP TABLE IF EXISTS Cattle;
DROP TABLE IF EXISTS Entity;
DROP TABLE IF EXISTS UnitOfMeasure;
DROP TABLE IF EXISTS Variety;
DROP TABLE IF EXISTS Horns;
DROP TABLE IF EXISTS Gender;
DROP TABLE IF EXISTS Colour;
DROP TABLE IF EXISTS Source;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS LogModule;
DROP TABLE IF EXISTS MyFarmLog;
DROP TABLE IF EXISTS Module;

-- Module -------------------------------------------------------
CREATE TABLE Module
(modID INTEGER PRIMARY KEY AUTOINCREMENT,
modShortName VARCHAR (10) NOT NULL UNIQUE,
modName VARCHAR (30) NOT NULL UNIQUE,
modSingularEntityName VARCHAR (10) NOT NULL,
modPluralEntityName VARCHAR (10) NOT NULL,
modDescription VARCHAR (255),
modVersion INTEGER NOT NULL,
modImagePath VARCHAR (255),
modShow BOOL DEFAULT 1);

-- MyFarmLog ----------------------------------------------------
CREATE TABLE MyFarmLog
(logID INTEGER PRIMARY KEY AUTOINCREMENT,
logShortName VARCHAR (10) NOT NULL UNIQUE,
logName VARCHAR (30) NOT NULL UNIQUE,
logDescription VARCHAR (255),
logImagePath VARCHAR (255),
logStartDate DATE NOT NULL,
logEndDate DATE,
logShow BOOL DEFAULT 1);

-- LogModule ----------------------------------------------------
CREATE TABLE LogModule
(lmdID INTEGER PRIMARY KEY AUTOINCREMENT,
lmdModID INTEGER NOT NULL,
lmdLogID INTEGER NOT NULL,
FOREIGN KEY (lmdModID) REFERENCES Module(modID),
FOREIGN KEY (lmdLogID) REFERENCES MyFarmLog(logID));

-- lmdModID triggers ------------------------
CREATE TRIGGER fki_lmdModID
	BEFORE INSERT ON LogModule
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "LogModule" violates foreign key constraint "lmdModID"')
		WHERE  NEW.lmdModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = new.lmdModID) IS NULL;
	END;

CREATE TRIGGER fku_lmdModID
	BEFORE UPDATE ON LogModule
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "LogModule" violates foreign key constraint "lmdModID"')
		WHERE  NEW.lmdModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = NEW.lmdModID) IS NULL;
	END;

CREATE TRIGGER fkd_lmdModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "lmdModID"')
		WHERE (SELECT lmdModID FROM LogModule WHERE lmdModID = OLD.modID) IS NOT NULL;
	END;

-- lmdLogID triggers ------------------------
CREATE TRIGGER fki_lmdLogID
	BEFORE INSERT ON LogModule
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "LogModule" violates foreign key constraint "lmdLogID"')
		WHERE  NEW.lmdLogID IS NOT NULL
			AND (SELECT logID FROM MyFarmLog WHERE logID = new.lmdLogID) IS NULL;
	END;

CREATE TRIGGER fku_lmdLogID
	BEFORE UPDATE ON LogModule
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "LogModule" violates foreign key constraint "lmdLogID"')
		WHERE  NEW.lmdLogID IS NOT NULL
			AND (SELECT logID FROM MyFarmLog WHERE logID = NEW.lmdLogID) IS NULL;
	END;

CREATE TRIGGER fkd_lmdLogID
	BEFORE DELETE ON MyFarmLog
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "lmdLogID"')
		WHERE (SELECT lmdLogID FROM LogModule WHERE lmdLogID = OLD.logID) IS NOT NULL;
	END;

-- Location ----------------------------------------------------
CREATE TABLE Location
(locID INTEGER PRIMARY KEY AUTOINCREMENT,
locModID INTEGER NOT NULL,
locName VARCHAR (30) NOT NULL UNIQUE,
locDescription VARCHAR (255),
locImagePath VARCHAR (255),
locShow BOOL DEFAULT 1,
FOREIGN KEY (locModID) REFERENCES Module(modID));

-- locModID triggers ------------------------
CREATE TRIGGER fki_locModID
	BEFORE INSERT ON Location
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Location" violates foreign key constraint "locModID"')
		WHERE  NEW.locModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = new.locModID) IS NULL;
	END;

CREATE TRIGGER fku_locModID
	BEFORE UPDATE ON Location
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Location" violates foreign key constraint "locModID"')
		WHERE  NEW.locModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = NEW.locModID) IS NULL;
	END;

CREATE TRIGGER fkd_locModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "locModID"')
		WHERE (SELECT locModID FROM Location WHERE locModID = OLD.modID) IS NOT NULL;
	END;

-- Source -------------------------------------------------------
CREATE TABLE Source
(srcID INTEGER PRIMARY KEY AUTOINCREMENT,
srcModID INTEGER NOT NULL,
srcName VARCHAR (30) NOT NULL UNIQUE,
srcAddress VARCHAR (255),
srcShow BOOL DEFAULT 1,
FOREIGN KEY (srcModID) REFERENCES Module(modID));

-- srcModID triggers ------------------------
CREATE TRIGGER fki_srcModID
	BEFORE INSERT ON Source
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Source" violates foreign key constraint "srcModID"')
		WHERE  NEW.srcModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = new.srcModID) IS NULL;
	END;

CREATE TRIGGER fku_srcModID
	BEFORE UPDATE ON Source
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Source" violates foreign key constraint "srcModID"')
		WHERE  NEW.srcModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = NEW.srcModID) IS NULL;
	END;

CREATE TRIGGER fkd_srcModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "srcModID"')
		WHERE (SELECT srcModID FROM Source WHERE srcModID = OLD.modID) IS NOT NULL;
	END;

-- Colour -------------------------------------------------------
CREATE TABLE Colour
(clrID INTEGER PRIMARY KEY AUTOINCREMENT,
clrModID INTEGER NOT NULL,
clrName VARCHAR (30) NOT NULL UNIQUE,
clrShow BOOL DEFAULT 1,
FOREIGN KEY (clrModID) REFERENCES Module(modID));

-- clrModID triggers ------------------------
CREATE TRIGGER fki_clrModID
	BEFORE INSERT ON Colour
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Colour" violates foreign key constraint "clrModID"')
		WHERE  NEW.clrModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = new.clrModID) IS NULL;
	END;

CREATE TRIGGER fku_clrModID
	BEFORE UPDATE ON Colour
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Colour" violates foreign key constraint "clrModID"')
		WHERE  NEW.clrModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = NEW.clrModID) IS NULL;
	END;

CREATE TRIGGER fkd_clrModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "clrModID"')
		WHERE (SELECT clrModID FROM Colour WHERE clrModID = OLD.modID) IS NOT NULL;
	END;
	

-- Gender -------------------------------------------------------
CREATE TABLE Gender
(gdrID INTEGER PRIMARY KEY AUTOINCREMENT,
gdrModID INTEGER NOT NULL,
gdrName VARCHAR (30) NOT NULL UNIQUE,
gdrShow BOOL DEFAULT 1,
FOREIGN KEY (gdrModID) REFERENCES Module(modID));

-- gdrModID triggers ------------------------
CREATE TRIGGER fki_gdrModID
	BEFORE INSERT ON Gender
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Gender" violates foreign key constraint "gdrModID"')
		WHERE  NEW.gdrModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = new.gdrModID) IS NULL;
	END;

CREATE TRIGGER fku_gdrModID
	BEFORE UPDATE ON Gender
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Gender" violates foreign key constraint "gdrModID"')
		WHERE  NEW.gdrModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = NEW.gdrModID) IS NULL;
	END;

CREATE TRIGGER fkd_gdrModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "gdrModID"')
		WHERE (SELECT gdrModID FROM Gender WHERE gdrModID = OLD.modID) IS NOT NULL;
	END;

-- Horns -------------------------------------------------------
CREATE TABLE Horns
(hrnID INTEGER PRIMARY KEY AUTOINCREMENT,
hrnModID INTEGER NOT NULL,
hrnName VARCHAR (30) NOT NULL UNIQUE,
hrnDescription VARCHAR (255),
hrnShow BOOL DEFAULT 1,
FOREIGN KEY (hrnModID) REFERENCES Module(modID));

-- hrnModID triggers ------------------------
CREATE TRIGGER fki_hrnModID
	BEFORE INSERT ON Horns
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Horns" violates foreign key constraint "hrnModID"')
		WHERE  NEW.hrnModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = new.hrnModID) IS NULL;
	END;

CREATE TRIGGER fku_hrnModID
	BEFORE UPDATE ON Horns
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Horns" violates foreign key constraint "hrnModID"')
		WHERE  NEW.hrnModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = NEW.hrnModID) IS NULL;
	END;

CREATE TRIGGER fkd_hrnModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "hrnModID"')
		WHERE (SELECT hrnModID FROM Horns WHERE hrnModID = OLD.modID) IS NOT NULL;
	END;

-- Variety -------------------------------------------------------
CREATE TABLE Variety
(varID INTEGER PRIMARY KEY AUTOINCREMENT,
varModID INTEGER NOT NULL,
varName VARCHAR (30) NOT NULL UNIQUE,
varDescription VARCHAR (255),
varImagePath VARCHAR (255),
varShow BOOL DEFAULT 1,
FOREIGN KEY (varModID) REFERENCES Module(modID));

-- varModID triggers ------------------------
CREATE TRIGGER fki_varModID
	BEFORE INSERT ON Variety
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Variety" violates foreign key constraint "varModID"')
		WHERE  NEW.varModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = new.varModID) IS NULL;
	END;

CREATE TRIGGER fku_varModID
	BEFORE UPDATE ON Variety
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Variety" violates foreign key constraint "varModID"')
		WHERE  NEW.varModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = NEW.varModID) IS NULL;
	END;

CREATE TRIGGER fkd_varModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "varModID"')
		WHERE (SELECT varModID FROM Variety WHERE varModID = OLD.modID) IS NOT NULL;
	END;

-- UnitOfMeasure ------------------------------------------------
CREATE TABLE UnitOfMeasure
(uomID INTEGER PRIMARY KEY AUTOINCREMENT,
uomModID INTEGER NOT NULL,
uomShortName VARCHAR(10) NOT NULL UNIQUE,
uomName VARCHAR (30),
uomMinValue REAL,
uomMaxValue REAL,
uomShow BOOL DEFAULT 1,
FOREIGN KEY (uomModID) REFERENCES Module(modID));

-- uomModID triggers ------------------------
CREATE TRIGGER fki_uomModID
	BEFORE INSERT ON UnitOfMeasure
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "UnitOfMeasure" violates foreign key constraint "uomModID"')
		WHERE  NEW.uomModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = new.uomModID) IS NULL;
	END;

CREATE TRIGGER fku_uomModID
	BEFORE UPDATE ON UnitOfMeasure
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "UnitOfMeasure" violates foreign key constraint "uomModID"')
		WHERE  NEW.uomModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = NEW.uomModID) IS NULL;
	END;

CREATE TRIGGER fkd_uomModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "uomModID"')
		WHERE (SELECT uomModID FROM UnitOfMeasure WHERE uomModID = OLD.modID) IS NOT NULL;
	END;

-- Entity -------------------------------------------------------
CREATE TABLE Entity
(entID INTEGER PRIMARY KEY AUTOINCREMENT,
entModID INTEGER NOT NULL,
entVarID INTEGER,
entLocID INTEGER,
entSrcID INTEGER,
entName VARCHAR (30) NOT NULL UNIQUE,
entDescription VARCHAR (255),
entImagePath VARCHAR (255),
entShow BOOL DEFAULT 1,
FOREIGN KEY (entModID) REFERENCES Module(modID),
FOREIGN KEY (entVarID) REFERENCES Variety(varID),
FOREIGN KEY (entLocID) REFERENCES Location(locID),
FOREIGN KEY (entSrcID) REFERENCES Source(srcID));

-- entModID triggers ------------------------
CREATE TRIGGER fki_entModID
	BEFORE INSERT ON Entity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Entity" violates foreign key constraint "entModID"')
		WHERE  NEW.entModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = new.entModID) IS NULL;
	END;

CREATE TRIGGER fku_entModID
	BEFORE UPDATE ON Entity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Entity" violates foreign key constraint "entModID"')
		WHERE  NEW.entModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = NEW.entModID) IS NULL;
	END;

CREATE TRIGGER fkd_entModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "entModID"')
		WHERE (SELECT entModID FROM Entity WHERE entModID = OLD.modID) IS NOT NULL;
	END;

-- entVarID triggers ------------------------
CREATE TRIGGER fki_entVarID
	BEFORE INSERT ON Entity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Entity" violates foreign key constraint "entVarID"')
		WHERE  NEW.entVarID IS NOT NULL
			AND (SELECT varID FROM Variety WHERE varID = new.entVarID) IS NULL;
	END;

CREATE TRIGGER fku_entVarID
	BEFORE UPDATE ON Entity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Entity" violates foreign key constraint "entVarID"')
		WHERE  NEW.entVarID IS NOT NULL
			AND (SELECT varID FROM Variety WHERE varID = NEW.entVarID) IS NULL;
	END;

CREATE TRIGGER fkd_entVarID
	BEFORE DELETE ON Variety
	FOR EACH ROW BEGIN
		DELETE from Entity WHERE entVarID = OLD.varID;
	END;
	
-- entVarID triggers ------------------------
CREATE TRIGGER fki_entLocID
	BEFORE INSERT ON Entity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Entity" violates foreign key constraint "entLocID"')
		WHERE  NEW.entLocID IS NOT NULL
			AND (SELECT locID FROM Location WHERE locID = new.entLocID) IS NULL;
	END;

CREATE TRIGGER fku_entLocID
	BEFORE UPDATE ON Entity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Entity" violates foreign key constraint "entLocID"')
		WHERE  NEW.entLocID IS NOT NULL
			AND (SELECT locID FROM Location WHERE locID = NEW.entLocID) IS NULL;
	END;

CREATE TRIGGER fkd_entLocID
	BEFORE DELETE ON Location
	FOR EACH ROW BEGIN
		DELETE from Entity WHERE entLocID = OLD.locID;
	END;

-- entVarID triggers ------------------------
CREATE TRIGGER fki_entSrcID
	BEFORE INSERT ON Entity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Entity" violates foreign key constraint "entSrcID"')
		WHERE  NEW.entSrcID IS NOT NULL
			AND (SELECT srcID FROM Source WHERE srcID = new.entSrcID) IS NULL;
	END;

CREATE TRIGGER fku_entSrcID
	BEFORE UPDATE ON Entity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Entity" violates foreign key constraint "entSrcID"')
		WHERE  NEW.entSrcID IS NOT NULL
			AND (SELECT srcID FROM Source WHERE srcID = NEW.entSrcID) IS NULL;
	END;

CREATE TRIGGER fkd_entSrcID
	BEFORE DELETE ON Source
	FOR EACH ROW BEGIN
		DELETE from Entity WHERE entSrcID = OLD.srcID;
	END;

-- Cattle ----------------------------------------------------------
CREATE TABLE Cattle
(cowID INTEGER PRIMARY KEY AUTOINCREMENT,
cowGdrID INTEGER NOT NULL,
cowHrnID INTEGER NOT NULL,
cowClrID INTEGER NOT NULL,
cowMotherentID INTEGER,
cowFatherentID INTEGER,
cowTag INTEGER NOT NULL,
cowNlsTag INTEGER NOT NULL,
FOREIGN KEY (cowID) REFERENCES Entity(entID),
FOREIGN KEY (cowGdrID) REFERENCES Gender(gdrID),
FOREIGN KEY (cowHrnID) REFERENCES Horns(hrnID),
FOREIGN KEY (cowClrID) REFERENCES Colour(clrID),
FOREIGN KEY (cowMotherentID) REFERENCES Entity(entID),
FOREIGN KEY (cowFatherentID) REFERENCES Entity(entID));

-- cowID triggers ------------------------
CREATE TRIGGER fki_cowID
	BEFORE INSERT ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Cattle" violates foreign key constraint "cowID"')
		WHERE  NEW.cowID IS NOT NULL
			AND (SELECT entID FROM Entity WHERE entID = NEW.cowID) IS NULL;
	END;

CREATE TRIGGER fku_cowID
	BEFORE UPDATE ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Cattle" violates foreign key constraint "cowID"')
		WHERE  NEW.cowID IS NOT NULL
			AND (SELECT entID FROM Entity WHERE entID = NEW.cowID) IS NULL;
	END;

CREATE TRIGGER fkd_cowID
	BEFORE DELETE ON Entity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Entity" violates foreign key constraint "cowID"')
		WHERE (SELECT cowID FROM Cattle WHERE cowID = OLD.entID) IS NOT NULL;
	END;

-- cowGdrID triggers ------------------------
CREATE TRIGGER fki_cowGdrID
	BEFORE INSERT ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Cattle" violates foreign key constraint "cowGdrID"')
		WHERE  NEW.cowGdrID IS NOT NULL
			AND (SELECT gdrID FROM Gender WHERE gdrID = NEW.cowGdrID) IS NULL;
	END;

CREATE TRIGGER fku_cowGdrID
	BEFORE UPDATE ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Cattle" violates foreign key constraint "cowGdrID"')
		WHERE  NEW.cowGdrID IS NOT NULL
			AND (SELECT gdrID FROM Gender WHERE gdrID = NEW.cowGdrID) IS NULL;
	END;

CREATE TRIGGER fkd_cowGdrID
	BEFORE DELETE ON Gender
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Gender" violates foreign key constraint "cowGdrID"')
		WHERE (SELECT cowGdrID FROM Cattle WHERE cowGdrID = OLD.gdrID) IS NOT NULL;
	END;

-- cowHrnID triggers ------------------------
CREATE TRIGGER fki_cowHrnID
	BEFORE INSERT ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Cattle" violates foreign key constraint "cowHrnID"')
		WHERE  NEW.cowHrnID IS NOT NULL
			AND (SELECT hrnID FROM Horns WHERE hrnID = NEW.cowHrnID) IS NULL;
	END;

CREATE TRIGGER fku_cowHrnID
	BEFORE UPDATE ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Cattle" violates foreign key constraint "cowHrnID"')
		WHERE  NEW.cowHrnID IS NOT NULL
			AND (SELECT hrnID FROM Horns WHERE hrnID = NEW.cowHrnID) IS NULL;
	END;

CREATE TRIGGER fkd_cowHrnID
	BEFORE DELETE ON Horns
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Horns" violates foreign key constraint "cowHrnID"')
		WHERE (SELECT cowHrnID FROM Cattle WHERE cowHrnID = OLD.hrnID) IS NOT NULL;
	END;

-- cowClrID triggers ------------------------
CREATE TRIGGER fki_cowClrID
	BEFORE INSERT ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Cattle" violates foreign key constraint "cowClrID"')
		WHERE  NEW.cowClrID IS NOT NULL
			AND (SELECT clrID FROM Colour WHERE clrID = NEW.cowClrID) IS NULL;
	END;

CREATE TRIGGER fku_cowClrID
	BEFORE UPDATE ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Cattle" violates foreign key constraint "cowClrID"')
		WHERE  NEW.cowClrID IS NOT NULL
			AND (SELECT clrID FROM Colour WHERE clrID = NEW.cowClrID) IS NULL;
	END;

CREATE TRIGGER fkd_cowClrID
	BEFORE DELETE ON Colour
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Colour" violates foreign key constraint "cowClrID"')
		WHERE (SELECT cowClrID FROM Cattle WHERE cowClrID = OLD.clrID) IS NOT NULL;
	END;

-- cowMotherentID triggers ------------------
CREATE TRIGGER fki_cowMotherentID
	BEFORE INSERT ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Cattle" violates foreign key constraint "cowMotherentID"')
		WHERE  NEW.cowMotherentID IS NOT NULL
			AND (SELECT entID FROM Entity WHERE entID = new.cowMotherentID) IS NULL;
	END;

CREATE TRIGGER fku_cowMotherentID
	BEFORE UPDATE ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Cattle" violates foreign key constraint "cowMotherentID"')
		WHERE  NEW.cowMotherentID IS NOT NULL
			AND (SELECT entID FROM Entity WHERE entID = NEW.cowMotherentID) IS NULL;
	END;

CREATE TRIGGER fkd_cowMotherentID
	BEFORE DELETE ON Entity
	FOR EACH ROW BEGIN
		DELETE from Cattle WHERE cowMotherentID = OLD.entID;
	END;

-- cowFatherentID triggers ------------------
CREATE TRIGGER fki_cowFatherentID
	BEFORE INSERT ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Cattle" violates foreign key constraint "cowFatherentID"')
		WHERE  NEW.cowFatherentID IS NOT NULL
			AND (SELECT entID FROM Entity WHERE entID = new.cowFatherentID) IS NULL;
	END;

CREATE TRIGGER fku_cowFatherentID
	BEFORE UPDATE ON Cattle
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Cattle" violates foreign key constraint "cowFatherentID"')
		WHERE  NEW.cowFatherentID IS NOT NULL
			AND (SELECT entID FROM Entity WHERE entID = NEW.cowFatherentID) IS NULL;
	END;

CREATE TRIGGER fkd_cowFatherentID
	BEFORE DELETE ON Entity
	FOR EACH ROW BEGIN
		DELETE from Cattle WHERE cowFatherentID = OLD.entID;
	END;

-- Vegetable ----------------------------------------------------
CREATE TABLE Vegetable
(vegID INTEGER PRIMARY KEY AUTOINCREMENT,
vegUomID INTEGER,
vegMinValue REAL,
vegMaxValue REAL,
FOREIGN KEY (vegID) REFERENCES Entity(entID),
FOREIGN KEY (vegUomID) REFERENCES UnitOfMeasure(uomID));

-- vegID triggers ------------------------
CREATE TRIGGER fki_vegID
	BEFORE INSERT ON Vegetable
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Vegetable" violates foreign key constraint "vegID"')
		WHERE  NEW.vegID IS NOT NULL
			AND (SELECT entID FROM Entity WHERE entID = NEW.vegID) IS NULL;
	END;

CREATE TRIGGER fku_vegID
	BEFORE UPDATE ON Vegetable
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Vegetable" violates foreign key constraint "vegID"')
		WHERE  NEW.vegID IS NOT NULL
			AND (SELECT entID FROM Entity WHERE entID = NEW.vegID) IS NULL;
	END;

CREATE TRIGGER fkd_vegID
	BEFORE DELETE ON Entity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Entity" violates foreign key constraint "vegID"')
		WHERE (SELECT vegID FROM Vegetable WHERE vegID = OLD.entID) IS NOT NULL;
	END;

-- vegUomID triggers ------------------
CREATE TRIGGER fki_vegUomID
	BEFORE INSERT ON Vegetable
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Vegetable" violates foreign key constraint "vegUomID"')
		WHERE  NEW.vegUomID IS NOT NULL
			AND (SELECT uomID FROM UnitOfMeasure WHERE uomID = new.vegUomID) IS NULL;
	END;

CREATE TRIGGER fku_vegUomID
	BEFORE UPDATE ON Vegetable
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Vegetable" violates foreign key constraint "vegUomID"')
		WHERE  NEW.vegUomID IS NOT NULL
			AND (SELECT uomID FROM UnitOfMeasure WHERE uomID = NEW.vegUomID) IS NULL;
	END;

CREATE TRIGGER fkd_vegUomID
	BEFORE DELETE ON UnitOfMeasure
	FOR EACH ROW BEGIN
		DELETE from Vegetable WHERE vegUomID = OLD.uomID;
	END;

-- Activity -----------------------------------------------------
CREATE TABLE Activity
(actID INTEGER PRIMARY KEY AUTOINCREMENT,
actModID INTEGER NOT NULL,
actName VARCHAR (30) NOT NULL UNIQUE,
actDescription VARCHAR (255),
actHasMeasure BOOL DEFAULT 1,
actShow BOOL DEFAULT 1,
FOREIGN KEY (actModID) REFERENCES Module(modID));

-- actModID triggers ------------------------
CREATE TRIGGER fki_actModID
	BEFORE INSERT ON Activity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Activity" violates foreign key constraint "actModID"')
		WHERE  NEW.actModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = new.actModID) IS NULL;
	END;

CREATE TRIGGER fku_actModID
	BEFORE UPDATE ON Activity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Activity" violates foreign key constraint "actModID"')
		WHERE  NEW.actModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = NEW.actModID) IS NULL;
	END;

CREATE TRIGGER fkd_actModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "actModID"')
		WHERE (SELECT actModID FROM Activity WHERE actModID = OLD.modID) IS NOT NULL;
	END;

-- Event --------------------------------------------------------
CREATE TABLE Event
(evtID INTEGER PRIMARY KEY AUTOINCREMENT,
evtModID INTEGER NOT NULL,
evtLogID INTEGER NOT NULL,
evtentID INTEGER NOT NULL,
evtActID INTEGER NOT NULL,
evtLocID INTEGER,
evtUomID INTEGER,
evtDate DATE NOT NULL,
evtImagePath VARCHAR (255),
evtNotes VARCHAR (255),
evtMeasurementValue REAL,
FOREIGN KEY (evtModID) REFERENCES Module(modID),
FOREIGN KEY (evtLogID) REFERENCES MyFarmLog(logID),
FOREIGN KEY (evtentID) REFERENCES Entity(entID),
FOREIGN KEY (evtActID) REFERENCES Activity(sctID),
FOREIGN KEY (evtLocID) REFERENCES Location(locID),
FOREIGN KEY (evtUomID) REFERENCES UnitOfMeasure(uomID));

-- evtModID triggers ------------------------
CREATE TRIGGER fki_evtModID
	BEFORE INSERT ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Event" violates foreign key constraint "evtModID"')
		WHERE  NEW.evtModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = new.evtModID) IS NULL;
	END;

CREATE TRIGGER fku_evtModID
	BEFORE UPDATE ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Event" violates foreign key constraint "evtModID"')
		WHERE  NEW.evtModID IS NOT NULL
			AND (SELECT modID FROM Module WHERE modID = NEW.evtModID) IS NULL;
	END;

CREATE TRIGGER fkd_evtModID
	BEFORE DELETE ON Module
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Module" violates foreign key constraint "evtModID"')
		WHERE (SELECT evtModID FROM Event WHERE evtModID = OLD.modID) IS NOT NULL;
	END;

-- evtLogID triggers ------------------------
CREATE TRIGGER fki_evtLogID
	BEFORE INSERT ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Event" violates foreign key constraint "evtLogID"')
		WHERE  NEW.evtLogID IS NOT NULL
			AND (SELECT logID FROM MyFarmLog WHERE logID = new.evtLogID) IS NULL;
	END;

CREATE TRIGGER fku_evtLogID
	BEFORE UPDATE ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Event" violates foreign key constraint "evtLogID"')
		WHERE  NEW.evtLogID IS NOT NULL
			AND (SELECT logID FROM MyFarmLog WHERE logID = NEW.evtLogID) IS NULL;
	END;

CREATE TRIGGER fkd_evtLogID
	BEFORE DELETE ON MyFarmLog
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "MyFarmLog" violates foreign key constraint "evtLogID"')
		WHERE (SELECT evtLogID FROM Event WHERE evtLogID = OLD.logID) IS NOT NULL;
	END;

-- evtentID triggers ------------------------
CREATE TRIGGER fki_evtentID
	BEFORE INSERT ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Event" violates foreign key constraint "evtentID"')
		WHERE  NEW.evtentID IS NOT NULL
			AND (SELECT entID FROM Entity WHERE entID = new.evtentID) IS NULL;
	END;

CREATE TRIGGER fku_evtentID
	BEFORE UPDATE ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Event" violates foreign key constraint "evtentID"')
		WHERE  NEW.evtentID IS NOT NULL
			AND (SELECT entID FROM Entity WHERE entID = NEW.evtentID) IS NULL;
	END;

CREATE TRIGGER fkd_evtentID
	BEFORE DELETE ON Entity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Entity" violates foreign key constraint "evtentID"')
		WHERE (SELECT evtentID FROM Event WHERE evtentID = OLD.entID) IS NOT NULL;
	END;

-- evtActID triggers ------------------------
CREATE TRIGGER fki_evtActID
	BEFORE INSERT ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Event" violates foreign key constraint "evtActID"')
		WHERE  NEW.evtActID IS NOT NULL
			AND (SELECT actID FROM Activity WHERE actID = new.evtActID) IS NULL;
	END;

CREATE TRIGGER fku_evtActID
	BEFORE UPDATE ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Event" violates foreign key constraint "evtActID"')
		WHERE  NEW.evtActID IS NOT NULL
			AND (SELECT actID FROM Activity WHERE actID = NEW.evtActID) IS NULL;
	END;

CREATE TRIGGER fkd_evtActID
	BEFORE DELETE ON Activity
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'delete on table "Activity" violates foreign key constraint "evtActID"')
		WHERE (SELECT evtActID FROM Event WHERE evtActID = OLD.actID) IS NOT NULL;
	END;

-- evtLocID triggers ------------------
CREATE TRIGGER fki_evtLocID
	BEFORE INSERT ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Event" violates foreign key constraint "evtLocID"')
		WHERE  NEW.evtLocID IS NOT NULL
			AND (SELECT locID FROM Location WHERE locID = new.evtLocID) IS NULL;
	END;

CREATE TRIGGER fku_evtLocID
	BEFORE UPDATE ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Event" violates foreign key constraint "evtLocID"')
		WHERE  NEW.evtLocID IS NOT NULL
			AND (SELECT locID FROM Location WHERE locID = NEW.evtLocID) IS NULL;
	END;

CREATE TRIGGER fkd_evtLocID
	BEFORE DELETE ON Location
	FOR EACH ROW BEGIN
		DELETE from Event WHERE evtLocID = OLD.locID;
	END;
	
-- evtUomID triggers ------------------
CREATE TRIGGER fki_evtUomID
	BEFORE INSERT ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'insert on table "Event" violates foreign key constraint "evtUomID"')
		WHERE  NEW.evtUomID IS NOT NULL
			AND (SELECT uomID FROM UnitOfMeasure WHERE uomID = new.evtUomID) IS NULL;
	END;

CREATE TRIGGER fku_evtUomID
	BEFORE UPDATE ON Event
	FOR EACH ROW BEGIN
		SELECT RAISE(ROLLBACK, 'update on table "Event" violates foreign key constraint "evtUomID"')
		WHERE  NEW.evtUomID IS NOT NULL
			AND (SELECT uomID FROM UnitOfMeasure WHERE uomID = NEW.evtUomID) IS NULL;
	END;

CREATE TRIGGER fkd_evtUomID
	BEFORE DELETE ON UnitOfMeasure
	FOR EACH ROW BEGIN
		DELETE from Event WHERE evtUomID = OLD.uomID;
	END;

-- read ---------------------------------------------------------
.read mf_initDataVeg.sql
.read mf_initDataCow.sql
.read mf_testQueries.sql