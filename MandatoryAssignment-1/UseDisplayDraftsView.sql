USE BlogDB;

-- Display all drafts.
SELECT * 
FROM DisplayDraftsView
WHERE EditDate < GETDATE() - 0;

-- Display all draft edited more than 3 days ago.
SELECT * 
FROM DisplayDraftsView
WHERE EditDate < GETDATE() - 3;
