USE BlogDB;
GO

/* Answer to Q2 */
SELECT a.PostId, a.Headline, b.TagId, c.TagName
  FROM dbo.Post a,
       dbo.TagAssignment b,
	   dbo.Tag c
 WHERE a.PostId = 1 
   AND a.PostId = b.PostId
   AND b.TagId = c.TagId;


  
