INSERT INTO Module (modID, modShortName, modName, modSingularEntityName, modPluralEntityName, modDescription, modVersion, modImagePath) 
	VALUES (95, 'VEG', 'Vegetable module', 'vegetable', 'vegetables', 'This module enables the storage of vegetable growing data', 'Veg_V1.01', '');

INSERT INTO MyFarmLog (logID, logShortName, logName, logDescription, logImagePath, logStartDate, logEndDate)
	VALUES (52, 'Veg 2009', 'Vegetables 2009', 'My Vegie Patch for 2009', '', 2009-01-01, '');

INSERT INTO LogModule (lmdID, lmdModID, lmdLogID)
	VALUES(51, 95, 52);

INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (51, 95, 'Front Yard', 'Lemon trees', '');
INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (52, 95, 'Side Garden', 'Watermelon patch', '');
INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (53, 95, 'Pot 1 on Verandah 1', 'Usually holds tomatoes', '');
INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (54, 95, 'Pot 2 on Verandah 1', 'Usually holds herbs', '');
INSERT INTO Location (locID, locModID, locName, locDescription, locImagePath) 
	VALUES (55, 95, 'Backyard', 'Usually pumpkins and zucchini', '');

INSERT INTO Source (srcID, srcModID, srcName, srcAddress)
	VALUES (51, 95, 'Digger', '');
INSERT INTO Source (srcID, srcModID, srcName, srcAddress)
	VALUES (52, 95, 'Mr Fothergills', '');
INSERT INTO Source (srcID, srcModID, srcName, srcAddress)
	VALUES (53, 95, 'Pohlmans', '');
INSERT INTO Source (srcID, srcModID, srcName, srcAddress)
	VALUES (54, 95, 'Jackies', '');
INSERT INTO Source (srcID, srcModID, srcName, srcAddress)
	VALUES (55, 95, 'Edens', '');
INSERT INTO Source (srcID, srcModID, srcName, srcAddress)
	VALUES (56, 95, 'Luigi', '');
INSERT INTO Source (srcID, srcModID, srcName, srcAddress)
	VALUES (57, 95, 'Yates', '');
INSERT INTO Source (srcID, srcModID, srcName, srcAddress)
	VALUES (58, 95, 'Floriana', '');
	
INSERT INTO UnitOfMeasure (uomID, uomModID, uomShortName, uomName, uomMinValue, uomMaxValue) 
	VALUES (51, 95, 'gms', 'grams', 0, 2000);
INSERT INTO UnitOfMeasure (uomID, uomModID, uomShortName, uomName, uomMinValue, uomMaxValue) 
	VALUES (52, 95, 'kgs', 'kilograms', 0, 20);
INSERT INTO UnitOfMeasure (uomID, uomModID, uomShortName, uomName, uomMinValue, uomMaxValue) 
	VALUES (53, 95, 'items', 'item count', 0, 200);
INSERT INTO UnitOfMeasure (uomID, uomModID, uomShortName, uomName, uomMinValue, uomMaxValue) 
	VALUES (54, 95, 'punnets', 'punnet count', 0, 50);
INSERT INTO UnitOfMeasure (uomID, uomModID, uomShortName, uomName, uomMinValue, uomMaxValue) 
	VALUES (55, 95, 'tubs', 'tub count', 0, 50);
	
INSERT INTO Variety (varID, varModID, varName, varDescription, varImagePath) 
	VALUES(51, 95, 'Tomatoes', '', '');
INSERT INTO Variety (varID, varModID, varName, varDescription, varImagePath) 
	VALUES(52, 95, 'Beans', '', '');
INSERT INTO Variety (varID, varModID, varName, varDescription, varImagePath) 
	VALUES(53, 95, 'Lettuce', '', '');

INSERT INTO Entity (entID, entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath)
	VALUES(51, 95, 51, 53, NULL, 'Moneymaker', '', '');
INSERT INTO Entity (entID, entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath)
	VALUES(52, 95, 51, 53, 52, 'Roma VF', '', '');
INSERT INTO Entity (entID, entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath)
	VALUES(53, 95, 51, 54, 51, 'Amish Oxheart', '', '');
INSERT INTO Entity (entID, entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath)
	VALUES(54, 95, 51, 55, 52, 'Red Cherry', '', '');
INSERT INTO Entity (entID, entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath)
	VALUES(55, 95, 52, 55, 52, 'Dwarf Snap', '', '');
INSERT INTO Entity (entID, entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath)
	VALUES(56, 95, 52, 55, 57, 'Gourmet Delight', '', '');
INSERT INTO Entity (entID, entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath)
	VALUES(57, 95, 53, 51, 53, 'Perpetual', '', '');
INSERT INTO Entity (entID, entModID, entVarID, entLocID, entSrcID, entName, entDescription, entImagePath)
	VALUES(58, 95, 53, 51, 53, 'Green Mignonette', '', '');

INSERT INTO Vegetable (vegID, vegUomID, vegMinValue, vegMaxValue)
	VALUES (51, 51, 0, 2000);
INSERT INTO Vegetable (vegID, vegUomID, vegMinValue, vegMaxValue)
	VALUES (52, NULL, NULL, NULL);
INSERT INTO Vegetable (vegID, vegUomID, vegMinValue, vegMaxValue)
	VALUES (53, 53, 0, 50);
	
INSERT INTO Activity (actID, actModID, actName, actDescription, actHasMeasure)
	VALUES (51, 95, 'Planted', '', 1);
INSERT INTO Activity (actID, actModID, actName, actDescription, actHasMeasure)
	VALUES (52, 95, 'Picked', '', 1);

INSERT INTO Event (evtID, evtModID, evtLogID, evtentID, evtActID, evtLocID, evtUomID, evtDate, evtImagePath, evtNotes, evtMeasurementValue)
	VALUES (51, 95, 52, 51, 51, 54, 51, 2009-02-21, '', 'They looked a bit droopy but hopefully all will be well', 12);
INSERT INTO Event (evtID, evtModID, evtLogID, evtentID, evtActID, evtLocID, evtUomID, evtDate, evtImagePath, evtNotes, evtMeasurementValue)
	VALUES (52, 95, 52, 53, 52, 55, 54, 2009-04-11, '', 'Goannas have had a feast, but there''s some left for me', 6);


