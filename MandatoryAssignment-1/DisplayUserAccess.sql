USE BlogDB;

SELECT a.UserFirstName, c.RoleName, e.AccessName
FROM dbo.BlogUser AS a
JOIN dbo.BlogRoleAssignment AS b ON b.UserId = a.UserId
JOIN dbo.BlogRole AS c ON b.RoleId = c.RoleId
JOIN dbo.BlogRoleAccess AS d ON b.RoleId = d.RoleId
JOIN dbo.BlogAccess AS e ON d.AccessId = e.AccessId
WHERE a.UserId = 1;

