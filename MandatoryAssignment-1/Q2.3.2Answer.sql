USE BlogDB;

-- Retrieve first level categories.
SELECT a.CategoryName AS Level1 
FROM dbo.BlogCategory AS a
WHERE a.ParentId IS NULL;


-- Retrieve first and second level categories.
SELECT a.CategoryName AS Level1,
       b.CategoryName AS Level2
FROM dbo.BlogCategory AS a
JOIN dbo.BlogCategory AS b ON a.CategoryId = b.ParentId
WHERE a.ParentId IS NULL;