USE BlogDB;

SELECT a.Headline, a.Content, b.LogDate, UserName = CONCAT(RTRIM(c.UserFirstName), ' ', RTRIM(c.UserLastName)), d.StateName
FROM dbo.BlogPost AS a
JOIN dbo.BlogLogEntry AS b ON a.PostId = b.PostId
JOIN dbo.BlogUser AS c ON b.UserId = c.UserId
JOIN dbo.BlogState AS d ON b.StateId = d.StateId


