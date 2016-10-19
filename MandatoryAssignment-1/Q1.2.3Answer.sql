USE BlogDB;
GO

/* Display the 10 lastest published blog posts. */
SELECT TOP 10 a.*, c.StateName
  FROM dbo.BlogPost AS a
  JOIN dbo.BlogLogEntry AS b ON a.PostId = b.PostId
  JOIN dbo.BlogState AS c ON b.StateId = c.StateId
  WHERE b.StateId = 2
  ORDER BY a.PostId DESC;
