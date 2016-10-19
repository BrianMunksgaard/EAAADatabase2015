-- =============================================
-- Author:		  Brian Munksgaard
-- Creation date: 05-12-2015
-- Description:	  This script is used to populate
--                the database with test data that
--                can be used to test views and
--                stored procedures.
-- =============================================
USE SenseiDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

BEGIN TRANSACTION PopulateDatabase;

-- Insert city zip codes and names. In a production
-- database these should be retrived/synchronized
-- from public available sources.
INSERT INTO dbo.City (CityZipCode, CityName)
VALUES
	('6400', 'Sønderborg'),
	('7400', 'Herning'),
	('7430', 'Ikast'),
	('8000', 'Århus C'),
	('8100', 'Århus C'),
	('8200', 'Århus N'),
	('8210', 'Århus V'),
	('8260', 'Viby J'),
	('8600', 'Silkeborg'),
	('9000', 'Ålborg'),
	('9900', 'Frederikshavn')

-- Insert user test data.
INSERT INTO dbo.Person (PersonUserName, PersonFirstName, PersonLastName, PersonEmail, PersonBirthday)
VALUES
	('bm', 'Brian', 'Munksgaard', 'brian.munksgaard@gmail.com', '19690918'),
	('em', 'Emil', 'Munksgaard', 'emil.munksgaard@gmail.com', '20001224'),
	('lm', 'Lucas', 'Munksgaard', 'lucas.munksgaard@gmail.com', '20011224'),
	('mm', 'Mikkel', 'Munksgaard', 'mikkelm.munksgaard@gmail.com', '20051224')

-- Insert credentials. In a production environment
-- the user password should be encrypted.
INSERT INTO dbo.PersonCredentials (UserName, UserPass)
VALUES
	('bm', 'Databaser2015')

-- Insert groups and subgroups.
INSERT INTO dbo.CourseGroup (CourseGroupName, CourseParentGroup)
VALUES
	-- Top level groups.
	('Musik', 0),
	('Outdoor', 0),

	-- Subgroups for 'Musik'
	('Guitar', 1),
	('Trommer', 1),
	
	-- Subgroups for 'Outdoor'
	('Sejllads', 2),
	('MTB', 2),
	('Golf', 2),

	-- Subgroups for 'Sejllads'
	('Kajak', 5),
	('Sejlbåd', 5),
	('Motorbåd', 5)

IF @@ERROR <> 0 
	BEGIN
		ROLLBACK TRANSACTION PopulateDatabase;
	END
ELSE
	BEGIN
		COMMIT TRANSACTION PopulateDatabase;
	END;

