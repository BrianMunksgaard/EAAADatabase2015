USE BlogDB;
GO

/* Answer to Q4 */
SELECT BlogEntries = count(b.PostId), a.CategoryName
  FROM dbo.CategoryAssignment b,
       dbo.Category a
  WHERE a.CategoryId = b.CategoryId
  GROUP BY b.CategoryId, a.CategoryName   
 HAVING count(b.PostId) >= 1

   ;