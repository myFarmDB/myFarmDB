-- test queries for myFarm DB

-- all tables
select   'Module==>',
         modID, modShortName, modName, modSingular, modPlural,  
         modDescription, modVersion, modImagePath, modShow
from     Module
order by modName, modID;

select   'MyFarmLog==>',
         logID, logShortName, logName, logDescription, 
         logImagePath, logStartDate, logEndDate, logShow
from     MyFarmLog
order by logName, logID;

select   'LogModule==>',
         lmdID, lmdLogID, lmdModID
from     LogModule
order by lmdModID, lmdLogID, lmdID;

select   'Location==>',
         locID, locModID, locName, locDescription, 
         locImagePath, locShow
from     Location
order by locModID, locName, locID;

select   'Source==>',
         srcID, srcModID, srcName, srcAddress, srcShow
from     Source
order by srcModID, srcName, srcID;

select   'Colour==>',
         clrID, clrModID, clrName, clrShow
from     Colour
order by clrModID, clrName, clrID;

select   'Gender==>',
         gdrID, gdrModID, gdrName, gdrShow
from     Gender
order by gdrModID, gdrName, gdrID;

select   'Horns==>',
         hrnID, hrnModID, hrnName, hrnDescription, hrnShow
from     Horns
order by hrnModID, hrnName, hrnID;

select   'Variety==>',
         varID, varModID, varName, varDescription, varImagePath, 
         varShow
from     Variety
order by varModID, varName, varID;

select   'UnitOfMeasure==>',
         uomID, uomModID, uomShortName, uomName, uomMinValue, 
         uomMaxValue, uomShow
from     UnitOfMeasure
order by uomModID, uomShortName, uomID;

select   'Entity==>',
         entID, entModID, entName, entDescription, entImagePath, 
         entLocID, entSrcID, entShow
from     Entity
order by entModID, entName, entID;

select   'Cattle==>',
         cowID, cowGdrID, cowHrnID, cowClrID, 
         cowMotherentID, cowFatherentID, cowTag, cowNcsTag
from     Cattle
order by cowID;

select   'Vegetable==>',
         vegID, vegUomID, vegMinValue, vegMaxValue
from     Vegetable
order by vegID;

select   'Activity==>',
         actID, actModID, actName, actDescription, actHasMeasure, 
         actShow
from     Activity
order by actModID, actName, actID;

select  'Event==>',
         evtID, evtModID, evtLogID, evtentID, evtActID, 
         evtLocID, evtDate, evtImagePath, evtNotes, 
         evtMeasurementValue, evtUomID
from     Event
order by evtModID, evtDate, evtID;


--boolean flag 1 true
select   'show gender true==>', 
         gdrName, gdrShow
from     gender
where    gdrShow
--where    gdrShow = 1
order by gdrID;


--boolean flag 0 false
select   'show gender false==>', 
         gdrName, gdrShow
from     gender
where    not gdrShow
--where    gdrShow = 0
order by gdrID;


--select all events
select   'Events==>',
         modShortName, 
         logShortName, logStartDate,
         varName,
         entName,
         actName,
         evtNotes, evtMeasurementValue,
         uomShortName
from     (((((((LogModule inner join MyFarmLog on logID = lmdLogID)
         inner join Module on modID = lmdModID)
         inner join Event on evtLogID = logID and evtModID = modID)
         inner join Activity on actID = evtActID)
         inner join Entity on entID = evtentID)
         left join Variety on varID = entVarID)
         left join UnitOfMeasure on uomID = evtUomID)
where    modShortName = 'COW'
         or modShortName = 'VEG'
order by modID, logID, evtDate, evtID;
