USE SenseiDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.CreateCourse') IS NOT NULL DROP PROCEDURE dbo.CreateCourse;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 05-12-2015
-- Description:	This stored procedure is used to
--              create a new course and the
--              associated location.
-- =============================================
CREATE PROCEDURE dbo.CreateCourse
	@CourseTitle nvarchar(30),
	@CourseDescription nvarchar(1000),
	@CoursePrerequisites nvarchar(500),
	@CoursePriceHour int,
	@CourseMaxAttendess int,
	@CourseStartDate date,
	@CourseEndDate date,
	@CourseIsActive int,
	@CourseGroupId int,
	@TeacherUserName nvarchar(30),	
	@LocationName nvarchar(50),
	@LocationStreet nvarchar(50),
	@LocationStreetNumber int,
	@LocationZipCode nvarchar(10)
AS
BEGIN

	BEGIN TRANSACTION CreateCourseTransaction;

	INSERT INTO dbo.Course (CourseTitle, CourseDescription, CoursePrerequisites, CoursePriceHour, CourseMaxAttendess,
							CourseStartDate, CourseEndDate, CourseIsActive, CourseGroupId, TeacherUserName)
	VALUES (@CourseTitle, @CourseDescription, @CoursePrerequisites, @CoursePriceHour, @CourseMaxAttendess,
			@CourseStartDate, @CourseEndDate, @CourseIsActive, @CourseGroupId, @TeacherUserName);

	DECLARE @CourseId AS int;
	SET @CourseId = SCOPE_IDENTITY();

	INSERT INTO dbo.Location (LocationName, LocationStreet, LocationStreetNumber, LocationZipCode)
	VALUES (@LocationName, @LocationStreet, @LocationStreetNumber, @LocationZipCode);

	DECLARE @LocationId AS int;
	SET @LocationId = SCOPE_IDENTITY();

	INSERT INTO dbo.CourseLocation(CourseId, LocationId)
	VALUES (@CourseId, @LocationId);

	IF @@ERROR <> 0 
		BEGIN
			ROLLBACK TRANSACTION CreateCourseTransaction;
			RETURN 1;
		END
	ELSE
		BEGIN
			COMMIT TRANSACTION CreateCourseTransaction;
			RETURN 0;
		END;
END;
GO

