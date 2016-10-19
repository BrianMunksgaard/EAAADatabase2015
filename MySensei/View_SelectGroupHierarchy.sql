-- =============================================
-- Author:		  Brian Munksgaard
-- Creation date: 06-12-2015
-- Description:	  This view is used to list
--                the hierarchy and the group
--                names of top 5 groups.
-- =============================================
USE SenseiDB;
GO

-- Retrieve groups hierachy and group name
-- for the five top level groups.
CREATE VIEW dbo.Top5GroupHierarchy
AS
SELECT a.CourseGroupName AS Level1,
       b.CourseGroupName AS Level2,
	   c.CourseGroupName AS Level3,
	   d.CourseGroupName AS Level4,
	   e.CourseGroupName AS Level5
FROM dbo.CourseGroup AS a
JOIN dbo.CourseGroup AS b ON a.CourseGroupId = b.CourseParentGroup
LEFT OUTER JOIN dbo.CourseGroup AS c ON b.CourseGroupId = c.CourseParentGroup
LEFT OUTER JOIN dbo.CourseGroup AS d ON c.CourseGroupId = d.CourseParentGroup
LEFT OUTER JOIN dbo.CourseGroup AS e ON d.CourseGroupId = e.CourseParentGroup
WHERE a.CourseParentGroup = 0
