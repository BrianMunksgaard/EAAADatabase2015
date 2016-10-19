USE BlogDB;

IF OBJECT_ID('dbo.PublishedView', 'V') IS NOT NULL DROP VIEW dbo.PublishedView;
GO

-- Create view used to display blog post that have been published.
CREATE VIEW dbo.PublishedView AS
SELECT a.Headline, b.UserId,
       PublishDate = b.LogDate,
       LastEditDate = (SELECT TOP 1 c.LogDate 
	                    FROM dbo.BlogLogEntry AS c
					    WHERE c.ActionId = 1 OR c.ActionId = 2
						ORDER BY c.LogDate DESC),
       EditedBy = (SELECT TOP 1 CONCAT(RTRIM(c2.UserFirstName), ' ', RTRIM(c2.UserLastName))
						FROM dbo.BlogLogEntry AS c
						JOIN dbo.BlogUser AS c2 ON c.UserId = c2.UserId
					    WHERE c.ActionId = 1 OR c.ActionId = 2
						ORDER BY c.LogDate DESC),
	   PublishedBy = CONCAT(RTRIM(d.UserFirstName), ' ', RTRIM(d.UserLastName)),
	   f.TagName,
	   h.CategoryName
FROM dbo.BlogPost AS a
JOIN dbo.BlogLogEntry AS b ON a.PostId = b.PostId
JOIN dbo.BlogUser AS d ON b.UserId = d.UserId 
LEFT OUTER JOIN dbo.BlogTagAssignment AS e ON a.PostId = e.PostId
LEFT JOIN dbo.BlogTag AS f ON e.TagId = f.TagId
JOIN dbo.BlogCategoryAssignment AS g ON a.PostId = g.PostId
JOIN dbo.BlogCategory AS h ON g.CategoryId = h.CategoryId
AND b.ActionId = 3 /* Published = Can be read by all */
;

