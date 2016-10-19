-- =============================================
-- Author:		  Brian Munksgaard
-- Creation date: 06-12-2015
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

INSERT INTO dbo.CourseLesson (CourseId,	CourseDay, CourseStartTime,	CourseEndTime)
VALUES
	(1, 3, '18:00:00', '20:00:00'), -- Guitar Tuesday.
	(1, 5, '18:00:00', '20:00:00'), -- Guitar Thursday.
	(2, 4, '18:00:00', '20:00:00'), -- Saling Wednesday.
	(2, 7, '10:00:00', '13:00:00'), -- Sailing Saturday.
	(3, 7, '10:00:00', '12:00:00'); -- Golf Saturday.

INSERT INTO dbo.Attending (AttendingUserName, AttendingCourseId)
VALUES
	('em', 2), -- Attending sailing course.
	('lm', 1), -- Attending guitar course.
	('lm', 2), -- Attending sailing course.
	('mm', 3); -- Attending golf couse.

INSERT INTO dbo.Review (CourseId, ReviewDate, ReviewRating, ReviewText, ReviewUserName)
VALUES
	(2, '20160312', 5, 'Super duper fantastic sailing course.', 'em'), -- Reviwing the sailing course, rating 5.
	(2, '20160212', 5, 'Nice sailing course.', 'lm'), -- Reviwing the sailing course, rating 5.
	(3, '20160210', 5, 'Great golf course, great teacher.', 'mm'); -- Reviwing the sailing course, rating 5.

IF @@ERROR <> 0 
	BEGIN
		ROLLBACK TRANSACTION PopulateDatabase;
	END
ELSE
	BEGIN
		COMMIT TRANSACTION PopulateDatabase;
	END;

