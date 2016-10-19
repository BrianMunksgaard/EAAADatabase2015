USE BlogDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
/* Clear all tables */
DELETE FROM dbo.BlogLogEntry;
DELETE FROM dbo.BlogRoleAccess;
DELETE FROM dbo.BlogRoleAssignment;
DELETE FROM dbo.BlogTagAssignment;
DELETE FROM dbo.BlogCategoryAssignment;
DELETE FROM dbo.BlogImageAssignment;

DELETE FROM dbo.BlogAction;
DELETE FROM dbo.BlogRole;
DELETE FROM dbo.BlogAccess;
DELETE FROM dbo.BlogUser;
DELETE FROM dbo.BlogTag;
DELETE FROM dbo.BlogCategory;
DELETE FROM dbo.BlogState;
DELETE FROM dbo.BlogPost;
DELETE FROM dbo.BlogImage;

/* Reset identity columns */
DBCC CHECKIDENT ('BlogRole', RESEED, 0);
DBCC CHECKIDENT ('BlogState', RESEED, 0);
DBCC CHECKIDENT ('BlogUser', RESEED, 0);
DBCC CHECKIDENT ('BlogCategory', RESEED, 0);
DBCC CHECKIDENT ('BlogTag', RESEED, 0);
DBCC CHECKIDENT ('BlogAccess', RESEED, 0);
DBCC CHECKIDENT ('BlogImage', RESEED, 0);
DBCC CHECKIDENT ('BlogPost', RESEED, 0);
DBCC CHECKIDENT ('BlogAction', RESEED, 0);
*/

/* Insert actions */
INSERT INTO dbo.BlogAction (ActionName)
VALUES
	('Create'),
	('Edit'),
	('Publish'),
	('Hide'),
	('Delete')

/* Insert roles */
INSERT INTO dbo.BlogRole (RoleName)
VALUES
		('Author'),
		('Administrator'),
		('Commentator');

/* Insert blog access modes */
INSERT INTO dbo.BlogAccess (AccessName)
VALUES
	('Read'),
	('Edit'),
	('Create'),
	('Delete');

/* Insert categories */
INSERT INTO dbo.BlogCategory (CategoryName, ParentId)
VALUES
	('Bådtyper', NULL),    -- Top level category
	('Kølbåd', 1),         -- Parent -> Bådtyper
	('Jolle', 1),          -- Parent -> Bådtyper
	('Motorbåd', 1),       -- Parent -> Bådtyper
	('Kajak', 1),          -- Parent -> Bådtyper
	('Beklædning', NULL),  -- Top level category
	('Sejlområder', NULL), -- Top level category
	('Klubber', 7),        -- Parent -> Sejlområder
	('Oplevelser', NULL);  -- Top level category

/* Insert blog states */
INSERT INTO dbo.BlogState (StateName)
VALUES
	('Draft'),
	('Published'),
	('Archived'),
	('Hidden');

/* Insert blog tags */
INSERT INTO dbo.BlogTag (TagName)
VALUES
	('Mast'),
	('Rig'),
	('Fortøjring'),
	('Påhængsmotor');
	
/* Assign role access */	
INSERT INTO dbo.BlogRoleAccess (RoleId, AccessId)
VALUES
	(1, 1), /* Author read */
	(1, 2), /* Author edit */
	(1, 3), /* Author create */
	(2, 1), /* Administrator read */
	(2, 2), /* Administrator edit */
	(2, 3), /* Administrator create */
	(2, 4), /* Administrator delete */
	(3, 1), /* Commentator read */
	(3, 2); /* Commentator edit */

/* Insert blog users */
INSERT INTO dbo.BlogUser (UserFirstName, UserLastName, UserEmail)
VALUES 
	('Brian', 'Munksgaard', 'brian.munksgaard@gmail.com'),
	('Emil', 'Munksgaard', 'emil.munksgaard@gmail.com'),
	('Lucas', 'Munksgaard', 'lucas.munksgaard@gmail.com'),
	('Mikkel', 'Munksgaard', 'mikkelm.munksgaard@gmail.com');

/* Assign roles to users */
INSERT INTO dbo.BlogRoleAssignment (UserId, RoleId)
VALUES
	(1, 2), /* Brian som Administrator */
	(2, 3), /* Emil som Commentator. */ 
	(3, 1), /* Lucas som Author */
	(4, 3); /* Mikkel som Commentator */

