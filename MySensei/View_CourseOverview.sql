-- =============================================
-- Author:		  Brian Munksgaard
-- Creation date: 06-12-2015
-- Description:	  This view is used to retrieve
--                a course overview with
--                information such as location,
--                city and teacher name.
--                The view is good for course
--                searches by ZipCode,
--                TeacherName and/or GroupName.
-- =============================================
USE SenseiDB;
GO

DROP VIEW dbo.CourseOverview;
GO

CREATE VIEW dbo.CourseOverview
AS
SELECT a.CourseId, a.CourseTitle, c.LocationName, LocationStreet = CONCAT(c.LocationStreet, ' ', c.LocationStreetNumber), d.CityZipCode, d.CityName, TeacherName = CONCAT(e.PersonFirstName, ' ', e.PersonLastName), f.CourseGroupName
FROM dbo.Course AS a, dbo.CourseLocation b, dbo.Location c, dbo.City d, Person e, CourseGroup f
WHERE a.CourseId = b.CourseId
  AND b.LocationId = c.LocationId
  AND c.LocationZipCode = d.CityZipCode
  AND a.TeacherUserName = e.PersonUserName
  AND a.CourseGroupId = f.CourseGroupId
  AND a.CourseIsActive = 1
  

     
