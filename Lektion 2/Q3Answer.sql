USE BlogDB;
GO

/* Answer to Q3 */
SELECT TOP 10 a.*
  FROM dbo.Post a
  ORDER BY a.PostId DESC;

