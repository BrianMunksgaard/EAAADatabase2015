USE BlogDB;
GO

-- Display the number of blog posts attached to each category
-- having at least one blog post attached.
SELECT BlogEntries = count(b.PostId), a.CategoryName
  FROM dbo.BlogCategoryAssignment b,
       dbo.BlogCategory a
  WHERE a.CategoryId = b.CategoryId
  GROUP BY b.CategoryId, a.CategoryName   
 HAVING count(b.PostId) >= 1