USE BlogDB;

-- Display blog post that have been published within the last 10 days
SELECT * from dbo.PublishedView
WHERE PublishDate > GETDATE() - 10;
