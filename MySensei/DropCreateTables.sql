-- =============================================
-- Author:		  Brian Munksgaard
-- Creation date: 05-12-2015
-- Description:	  This script is used to drop and
--                create all the tables used in
--                used in the SenseiDB.
-- =============================================
USE SenseiDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------------------
-- Drop all tables.
----------------------
IF OBJECT_ID('dbo.Review', 'U') IS NOT NULL DROP TABLE dbo.Review;
IF OBJECT_ID('dbo.Attending', 'U') IS NOT NULL DROP TABLE dbo.Attending;
IF OBJECT_ID('dbo.CourseTagAssignment', 'U') IS NOT NULL DROP TABLE dbo.CourseTagAssignment;
IF OBJECT_ID('dbo.CourseLocation', 'U') IS NOT NULL DROP TABLE dbo.CourseLocation;
IF OBJECT_ID('dbo.CourseTag', 'U') IS NOT NULL DROP TABLE dbo.CourseTag;
IF OBJECT_ID('dbo.CourseLesson', 'U') IS NOT NULL DROP TABLE dbo.CourseLesson;
IF OBJECT_ID('dbo.Location', 'U') IS NOT NULL DROP TABLE dbo.Location;
IF OBJECT_ID('dbo.City', 'U') IS NOT NULL DROP TABLE dbo.City;
IF OBJECT_ID('dbo.Course', 'U') IS NOT NULL DROP TABLE dbo.Course;
IF OBJECT_ID('dbo.CourseGroup', 'U') IS NOT NULL DROP TABLE dbo.CourseGroup;
IF OBJECT_ID('dbo.PersonCredentials', 'U') IS NOT NULL DROP TABLE dbo.PersonCredentials;
IF OBJECT_ID('dbo.Person', 'U') IS NOT NULL DROP TABLE dbo.Person;

----------------------
-- Create all tables.
----------------------
CREATE TABLE dbo.Person (
	PersonUserName nvarchar(30) NOT NULL PRIMARY KEY,
	PersonFirstName nvarchar(30) NOT NULL,
	PersonLastName nvarchar(30) NOT NULL,
	PersonEmail nvarchar(75) NOT NULL,
	PersonBirthday date NOT NULL
) ON [PRIMARY];

CREATE TABLE dbo.PersonCredentials (
	UserName nvarchar(30) NOT NULL PRIMARY KEY,
	UserPass nvarchar(100) NOT NULL
) ON [PRIMARY];

CREATE TABLE dbo.CourseGroup (
	CourseGroupId int IDENTITY(1,1) PRIMARY KEY,
	CourseGroupName nvarchar(30) NOT NULL UNIQUE,
	CourseParentGroup int
) ON [PRIMARY];

CREATE TABLE dbo.Course (
	CourseId int IDENTITY(1,1) PRIMARY KEY,
	CourseTitle nvarchar(30) NOT NULL,
	CourseDescription nvarchar(1000) NOT NULL,
	CoursePrerequisites nvarchar(500) NOT NULL,
	CoursePriceHour int NOT NULL,
	CourseMaxAttendess int NOT NULL,
	CourseStartDate date NOT NULL,
	CourseEndDate date NOT NULL,
	CourseIsActive int NOT NULL CHECK(CourseIsActive = 0 OR CourseIsActive = 1),
	CourseGroupId int NOT NULL FOREIGN KEY REFERENCES CourseGroup(CourseGroupId),
	TeacherUserName nvarchar(30) NOT NULL FOREIGN KEY REFERENCES Person(PersonUserName)
) ON [PRIMARY];

CREATE TABLE dbo.City (
	CityZipCode nvarchar(10) NOT NULL,
	CityName nvarchar(30) NOT NULL
	PRIMARY KEY (CityZipCode)
) ON [PRIMARY];

CREATE TABLE dbo.Location (
	LocationId int IDENTITY(1,1) PRIMARY KEY,
	LocationName nvarchar(50) NOT NULL,
	LocationStreet nvarchar(50) NOT NULL,
	LocationStreetNumber int NOT NULL,
	LocationZipCode nvarchar(10) NOT NULL FOREIGN KEY REFERENCES City(CityZipCode)
) ON [PRIMARY];

CREATE TABLE dbo.CourseLesson (
	CourseId int FOREIGN KEY REFERENCES Course(CourseId),
	CourseDay int NOT NULL CHECK(CourseDay >= 1 AND CourseDay <= 7),
	CourseStartTime time NOT NULL,
	CourseEndTime time NOT NULL
	PRIMARY KEY (CourseId, CourseDay)
) ON [PRIMARY];

CREATE TABLE dbo.CourseTag (
	TagName nvarchar(30) PRIMARY KEY
) ON [PRIMARY];

CREATE TABLE dbo.CourseLocation (
	CourseId int FOREIGN KEY REFERENCES Course(CourseId),
	LocationId int FOREIGN KEY REFERENCES Location(LocationId)
	PRIMARY KEY (CourseId, LocationId)
) ON [PRIMARY];

CREATE TABLE dbo.CourseTagAssignment (
	CourseId int FOREIGN KEY REFERENCES Course(CourseId),
	TagName nvarchar(30) FOREIGN KEY REFERENCES CourseTag(TagName)
	PRIMARY KEY (CourseId, TagName)
) ON [PRIMARY];

CREATE TABLE dbo.Attending (
	AttendingUserName nvarchar(30) FOREIGN KEY REFERENCES Person(PersonUserName),
	AttendingCourseId int FOREIGN KEY REFERENCES Course(CourseId)
	PRIMARY KEY(AttendingUserName, AttendingCourseId)
) ON [PRIMARY];

CREATE TABLE dbo.Review (
	CourseId int FOREIGN KEY REFERENCES Course(CourseId),
	ReviewId int IDENTITY(1,1),
	ReviewDate datetime NOT NULL,
	ReviewRating int NOT NULL CHECK(ReviewRating >= 0 AND ReviewRating <= 5),
	ReviewText nvarchar(500) NOT NULL,
	ReviewUserName nvarchar(30) FOREIGN KEY REFERENCES Person(PersonUserName)
	PRIMARY KEY(CourseId, ReviewId)
) ON [PRIMARY];
