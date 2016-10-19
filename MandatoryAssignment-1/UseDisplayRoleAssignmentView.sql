USE BlogDB;

-- Diplay number of user assigned to each role.
SELECT *
FROM dbo.DisplayRoleAssignmentView;

-- Display the number of user assigned to the
-- administrator role.
SELECT *
FROM dbo.DisplayRoleAssignmentView
WHERE RoleName='Administrator';
