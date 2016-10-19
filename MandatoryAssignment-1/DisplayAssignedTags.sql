USE BlogDB;

SELECT a.Headline, c.TagId, c.TagName
FROM dbo.BlogPost AS a
JOIN dbo.BlogTagAssignment AS b ON a.PostId = b.PostId
JOIN dbo.BlogTag AS c on b.TagId = c.TagId
WHERE a.PostId = 1;



