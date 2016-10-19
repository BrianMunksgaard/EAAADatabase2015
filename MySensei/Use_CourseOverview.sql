USE SenseiDB;

-- All courses.
SELECT * FROM dbo.CourseOverview

-- All courses in 8600 Silkeborg.
SELECT * FROM dbo.CourseOverview
 WHERE CityZipCode = '8600'

SELECT * FROM dbo.CourseOverview
 WHERE CourseGroupName = 'Guitar'

