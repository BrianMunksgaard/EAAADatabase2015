USE BlogDB;

IF OBJECT_ID('dbo.DisplayDraftsView', 'V') IS NOT NULL DROP VIEW dbo.DisplayDraftsView;
GO

-- Display blog post that are still drafts.
CREATE VIEW DisplayDraftsView AS
SELECT a.Headline,
	   EditDate = b.LogDate,
	   UserName = CONCAT(RTRIM(c.UserFirstName), ' ', RTRIM(c.UserLastName)),
	   d.StateName
FROM dbo.BlogPost AS a
JOIN dbo.BlogLogEntry AS b ON a.PostId = b.PostId
JOIN dbo.BlogUser AS c ON b.UserId = c.UserId 
JOIN dbo.BlogState AS d ON b.StateId = d.StateId
AND b.StateId = 1;


