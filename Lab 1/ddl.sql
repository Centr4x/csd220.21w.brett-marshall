USE CSD220_LAB1_BRETTMARSHALL;

CREATE TABLE IF NOT EXISTS `BUILDING`(
	`NAME` VARCHAR(50) NOT NULL,
	`CODE` CHAR(3) NOT NULL,
	`SQUARE FOOTAGE` INT UNSIGNED NOT NULL,
	`NUMBER OF FLOORS` INT UNSIGNED NOT NULL,
	`BUILDING OPENS` TIME NOT NULL DEFAULT '06:00:00',
	`BUILDING CLOSES` TIME NOT NULL DEFAULT '22:00:00',
	PRIMARY KEY (`CODE`),
	INDEX IDX_NAME (`NAME`)
	);
	

CREATE TABLE IF NOT EXISTS `ROOM`(
    `BUILDING CODE` CHAR(3) NOT NULL,
	`FLOOR` INT UNSIGNED NOT NULL,
	`ROOM TPYE` ENUM ('CLASSROOM','LECTURE HALL','LAB','OFFICE','BATHROOM','UTILITY') NOT NULL,
	`ROOM NUMBER` INT UNSIGNED NOT NULL,
	`SQUARE FOOTAGE` INT UNSIGNED NOT NULL,
	`ROOM HAS WINDOW` BOOLEAN NOT NULL,
	FOREIGN KEY(`BUILDING CODE`) REFERENCES `BUILDING`(`CODE`) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY (`BUILDING CODE`, `ROOM NUMBER`)
	);
	
INSERT INTO BUILDING (`NAME`,`CODE`,`SQUARE FOOTAGE`,`NUMBER OF FLOORS`,`BUILDING OPENS`,`BUILDING CLOSES`) VALUES
('BRETTS HOUSE', 'BH', 25, 3,'06:00:00', '23:00:00'),
('HOTEL', 'HOT', 20, 15,'08:00:00', '22:00:00'),
('WORK', 'WOK', 15, 6,'06:00:00', '23:00:00');

INSERT INTO BUILDING (`NAME`,`CODE`,`SQUARE FOOTAGE`,`NUMBER OF FLOORS`,`BUILDING OPENS`,`BUILDING CLOSES`) VALUES
('PARTY HOUSE', 'PH', 25, 3,'23:00:00', '03:00:00');

INSERT INTO BUILDING (`NAME`,`CODE`,`SQUARE FOOTAGE`,`NUMBER OF FLOORS`,`BUILDING OPENS`,`BUILDING CLOSES`) VALUES
('GAMER HOUSE', 'GH', 22, 2,'23:00:00', '02:00:00');

ALTER TABLE CSD220_LAB1_BRETTMARSHALL.ROOM CHANGE `ROOM TPYE` `ROOM TYPE` ENUM('CLASSROOM','LECTURE HALL','LAB','OFFICE','BATHROOM','UTILITY') CHARACTER SET UTF8MB4 COLLATE UTF8MB4_UNICODE_CI NOT NULL;

INSERT INTO ROOM(`BUILDING CODE`,`FLOOR`,`ROOM TYPE`,`ROOM NUMBER`,`SQUARE FOOTAGE`,`ROOM HAS WINDOW`) VALUES
('BH',1,'LECTURE HALL',101,10,TRUE),
('BH',2,'OFFICE',201,10,TRUE),
('HOT',10,'CLASSROOM',1001,10,FALSE),
('WOK',1,'LECTURE HALL',101,20,TRUE),
('WOK',11,'LAB',1101,10,FALSE);

INSERT INTO ROOM(`BUILDING CODE`,`FLOOR`,`ROOM TYPE`,`ROOM NUMBER`,`SQUARE FOOTAGE`,`ROOM HAS WINDOW`) VALUES
('HOT',4,'BATHROOM',401,10,TRUE);