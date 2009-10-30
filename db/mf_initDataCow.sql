INSERT INTO Module (modID, modShortName, modName, modSingularEntityName, modPluralEntityName, modDescription, modVersion, modImagePath) 
	VALUES (1, 'NA', 'Not Applicable', 'NA', 'NA', 'This module is used where a module field is not applicable', 'NA', '');
INSERT INTO Module (modID, modShortName, modName, modSingularEntityName, modPluralEntityName, modDescription, modVersion, modImagePath) 
	VALUES (2, 'COW', 'Cattle Module', 'COW', 'cattle', 'This module enables the storage of cattle geneaology and related data', 'Cow_V1.01', '');

INSERT INTO MyFarmLog (logID, logShortName, logName, logDescription, logImagePath, logStartDate, logEndDate)
	VALUES (1, 'Cattle', 'My Cattle', '', '', 2009-01-01, '');
	
INSERT INTO LogModule (lmdID, lmdModID, lmdLogID)
	VALUES(1, 2, 1);

INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (1, 2, 'Lower Paddock', '', '');
INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (2, 2, 'Upper Paddock', '', '');
	
INSERT INTO Source (srcID, srcModID, srcName, srcAddress)
	VALUES (1, 2, 'Farmer Jones', 'The Farm, Old Farm Rd, Battington');

INSERT INTO Colour (clrID, clrModID, clrName)
	VALUES (1, 1, 'Brown');
INSERT INTO Colour (clrID, clrModID, clrName)
	VALUES (2, 1, 'Black');
INSERT INTO Colour (clrID, clrModID, clrName)
	VALUES (3, 1, 'White');
INSERT INTO Colour (clrID, clrModID, clrName)
	VALUES (4, 1, 'Brindle');

INSERT INTO Gender (gdrID, gdrModID, gdrName, gdrShow)
	VALUES (1, 1, 'Male', 0);
INSERT INTO Gender (gdrID, gdrModID, gdrName, gdrShow)
	VALUES (2, 1, 'Female', 0);
INSERT INTO Gender (gdrID, gdrModID, gdrName)
	VALUES (3, 2, 'Bull');
INSERT INTO Gender (gdrID, gdrModID, gdrName)
	VALUES (4, 2, 'Cow');
	
INSERT INTO Horns (hrnID, hrnModID, hrnName, hrnDescription) 
	VALUES (1, 2, 'One Horn', 'A Cow with one horn');
INSERT INTO Horns (hrnID, hrnModID, hrnName, hrnDescription) 
	VALUES (2, 2, 'No Horns', 'A Cow with no horns');

INSERT INTO Variety (varID, varModID, varName, varDescription, varImagePath) 
	VALUES(1, 2, 'Brahman', '', '');
INSERT INTO Variety (varID, varModID, varName, varDescription, varImagePath) 
	VALUES(2, 2, 'Angus', '', '');
	
INSERT INTO Entity (entID, entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath)
	VALUES(1, 2, 1, 1, 1, 'Mary Lou', '', '');
INSERT INTO Entity (entID, entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath)
	VALUES(2, 2, 2, 1, NULL, 'Big Boy', 'My favourite Bull', '');
INSERT INTO Entity (entID, entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath)
	VALUES(3, 2, 1, 1, NULL, 'Little Miss', '', '');
	
INSERT INTO Cattle (cowID, cowGdrID, cowHrnID, cowClrID, cowMotherentID, cowFatherentID, cowTag, cowNlsTag)
	VALUES(1, 4, 2, 2, NULL, NULL, '1123', '1432');
INSERT INTO Cattle (cowID, cowGdrID, cowHrnID, cowClrID, cowMotherentID, cowFatherentID, cowTag, cowNlsTag)
	VALUES(2, 2, 1, 3, NULL, NULL, '2123', '2432');
INSERT INTO Cattle (cowID, cowGdrID, cowHrnID, cowClrID, cowMotherentID, cowFatherentID, cowTag, cowNlsTag)
	VALUES(3, 4, 2, 4, 1, 2, '2123', '2432');
	
INSERT INTO Activity (actID, actModID, actName, actDescription, actHasMeasure)
	VALUES (1, 2, 'Born', '', 0);
INSERT INTO Activity (actID, actModID, actName, actDescription, actHasMeasure)
	VALUES (2, 2, 'Died', '', 0);

INSERT INTO Event (evtID, evtModID, evtLogID, evtentID, evtActID, evtLocID, evtUomID, evtDate, evtImagePath, evtNotes, evtMeasurementValue)
	VALUES (1, 2, 1, 3, 1, 1, NULL, 2009-02-24, '', 'She is such a cute little thing. Just like her mother', '');
INSERT INTO Event (evtID, evtModID, evtLogID, evtentID, evtActID, evtLocID, evtUomID, evtDate, evtImagePath, evtNotes, evtMeasurementValue)
	VALUES (2, 2, 1, 2, 2, 1, NULL, 2009-05-21, '', 'A sad day!', '');
	
	
	