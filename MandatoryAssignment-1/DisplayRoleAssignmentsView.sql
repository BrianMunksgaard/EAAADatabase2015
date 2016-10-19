USE BlogDB;

IF OBJECT_ID('dbo.DisplayRoleAssignmentView', 'V') IS NOT NULL DROP VIEW dbo.DisplayRoleAssignmentView;
GO

-- Display the number of users assigned to each role.
CREATE VIEW dbo.DisplayRoleAssignmentView AS 
SELECT a.RoleName, COUNT(b.RoleId) AS NumberOfUsers
FROM dbo.BlogRole AS a
JOIN dbo.BlogRoleAssignment AS b ON a.RoleId = b.RoleId
GROUP BY a.RoleName;
