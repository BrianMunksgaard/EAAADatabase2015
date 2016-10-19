
-- Retrieve tags associated with a blog post.
CREATE VIEW DisplayAssignedTagsView AS
SELECT a.Headline, c.TagId, c.TagName
FROM dbo.BlogPost AS a
JOIN dbo.BlogTagAssignment AS b ON a.PostId = b.PostId
JOIN dbo.BlogTag AS c on b.TagId = c.TagId;
GO

-- Retrieve latest 10 published blog posts.
CREATE VIEW DisplayTenLastesPublishedBlogPostsView
AS
SELECT TOP 10 a.*, c.StateName
  FROM dbo.BlogPost AS a
  JOIN dbo.BlogLogEntry AS b ON a.PostId = b.PostId
  JOIN dbo.BlogState AS c ON b.StateId = c.StateId
  WHERE b.StateId = 2
  ORDER BY a.PostId DESC;
GO

-- Retrieve the number of blog post for the categories.
-- that have at least one blog post attached.
CREATE VIEW DisplayNumberOfBlogPostForCategory
AS
SELECT BlogEntries = count(b.PostId), a.CategoryName
  FROM dbo.BlogCategoryAssignment b,
       dbo.BlogCategory a
  WHERE a.CategoryId = b.CategoryId
  GROUP BY b.CategoryId, a.CategoryName   
 HAVING count(b.PostId) >= 1
GO

-- Retrieve published blog posts with relevant meta data.
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
GO

-- Display first and second level categories.
CREATE VIEW DisplayFirstAndSecondLevelCategoriesView AS
SELECT a.CategoryName AS Level1,
       b.CategoryName AS Level2
FROM dbo.BlogCategory AS a
JOIN dbo.BlogCategory AS b ON a.CategoryId = b.ParentId
WHERE a.ParentId IS NULL;
GO