USE BlogDB;
GO

/* Answer to Q5 */
SELECT a.*
  FROM dbo.Post a
  WHERE a.Headline LIKE '%Hexia%'
    AND a.Content LIKE '%Hexia%';