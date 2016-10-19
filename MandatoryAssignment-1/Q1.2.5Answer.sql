USE BlogDB;
GO

/* Do text search in both headline and content. */
SELECT a.*
  FROM dbo.BlogPost AS a
  WHERE a.Headline LIKE '%RS%'
    AND a.Content LIKE '%Tera%';