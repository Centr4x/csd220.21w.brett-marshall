USE CSD220_LAB1_BRETTMARSHALL;

SELECT DISTINCT `ROOM TYPE` FROM ROOM;

SELECT `NAME` FROM `BUILDING`
WHERE `BUILDING OPENS` <= '24:00:00' AND `BUILDING CLOSES` <= '02:00:00';


/*  Try something like this:
WHERE
	-- Open 24 hrs
	lock_time IS NULL 
	-- Open at midnight and locked anywhere thereafter
	OR ( open_time < lock_time AND open_time = '0:00' AND lock_time > '2:00')
	-- Locked after 2am (open_time will be bigger than lock_time)
	OR ( open_time > lock_time AND lock_time >= '2:00')
	*/

SELECT `ROOM TYPE`,`BUILDING CODE`,`ROOM NUMBER` FROM ROOM
WHERE `ROOM TYPE` = 'OFFICE' AND `ROOM HAS WINDOW` = 1;

SELECT `ROOM TYPE`,`BUILDING CODE`,`ROOM NUMBER`,`SQUARE FOOTAGE` FROM ROOM
WHERE `ROOM TYPE` = 'LAB' AND `SQUARE FOOTAGE` >= 500;

SELECT COUNT(`ROOM NUMBER`) FROM ROOM
WHERE `BUILDING CODE` = 'BH';

SELECT CONCAT (`BUILDING CODE`,'-',`ROOM NUMBER`) FROM ROOM;
