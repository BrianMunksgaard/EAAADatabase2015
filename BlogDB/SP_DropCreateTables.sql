USE BlogDB;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.DropCreateTables') IS NOT NULL DROP PROCEDURE dbo.DropCreateTables;
GO

-- =============================================
-- Author:		Brian Munksgaard
-- Create date: 17-09-2015
-- Description:	This stored procedure is used to
--              delete and create the tables 
--              used in the BlogDB.
-- =============================================
CREATE PROCEDURE dbo.DropCreateTables
AS
BEGIN

	/* First remove junction tables */
	IF OBJECT_ID('dbo.BlogLogEntry', 'U') IS NOT NULL DROP TABLE dbo.BlogLogEntry;
	IF OBJECT_ID('dbo.BlogRoleAssignment', 'U') IS NOT NULL DROP TABLE dbo.BlogRoleAssignment;
	IF OBJECT_ID('dbo.BlogImageAssignment', 'U') IS NOT NULL DROP TABLE dbo.BlogImageAssignment;
	IF OBJECT_ID('dbo.BlogTagAssignment', 'U') IS NOT NULL DROP TABLE dbo.BlogTagAssignment;
	IF OBJECT_ID('dbo.BlogCategoryAssignment', 'U') IS NOT NULL DROP TABLE dbo.BlogCategoryAssignment;
	IF OBJECT_ID('dbo.BlogRoleAccess', 'U') IS NOT NULL DROP TABLE dbo.BlogRoleAccess;

	/* Remove rest of the tables */
	IF OBJECT_ID('dbo.BlogAction', 'U') IS NOT NULL DROP TABLE dbo.BlogAction;
	IF OBJECT_ID('dbo.BlogRole', 'U') IS NOT NULL DROP TABLE dbo.BlogRole;
	IF OBJECT_ID('dbo.BlogState', 'U') IS NOT NULL DROP TABLE dbo.BlogState;
	IF OBJECT_ID('dbo.BlogCategory', 'U') IS NOT NULL DROP TABLE dbo.BlogCategory;
	IF OBJECT_ID('dbo.BlogTag', 'U') IS NOT NULL DROP TABLE dbo.BlogTag;
	IF OBJECT_ID('dbo.BlogImage', 'U') IS NOT NULL DROP TABLE dbo.BlogImage;
	IF OBJECT_ID('dbo.BlogAccess', 'U') IS NOT NULL DROP TABLE dbo.BlogAccess;

	IF OBJECT_ID('dbo.BlogPost', 'U') IS NOT NULL DROP TABLE dbo.BlogPost;
	IF OBJECT_ID('dbo.BlogUser', 'U') IS NOT NULL DROP TABLE dbo.BlogUser;

	BEGIN TRANSACTION CreateTransaction;

	SET ANSI_NULLS ON;
	SET QUOTED_IDENTIFIER ON;

	CREATE TABLE dbo.BlogRole (
		RoleId int IDENTITY(1,1) PRIMARY KEY,
		RoleName nchar(30) NOT NULL
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogState(
		StateId int IDENTITY(1,1) PRIMARY KEY,
		StateName nchar(30) NOT NULL
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogUser(
		UserId int IDENTITY(1,1) PRIMARY KEY,
		UserFirstName nchar(30) NOT NULL,
		UserLastName nchar(30) NOT NULL,
		UserEmail nchar(75) NOT NULL
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogCategory (
		CategoryId int IDENTITY(1,1) PRIMARY KEY,
		CategoryName nchar(30) NOT NULL,
		ParentId int FOREIGN KEY REFERENCES BlogCategory(CategoryId)
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogTag (
		TagId int IDENTITY(1,1) PRIMARY KEY,
		TagName nchar(30)
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogAccess (
		AccessId int IDENTITY(1,1) PRIMARY KEY,
		AccessName nchar(30) NOT NULL
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogRoleAccess (
		RoleId int FOREIGN KEY REFERENCES BlogRole(RoleId),
		AccessId int FOREIGN KEY REFERENCES BlogAccess(AccessId)
		PRIMARY KEY (RoleId, AccessId)
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogRoleAssignment (
		UserId int FOREIGN KEY REFERENCES BlogUser(UserId),
		RoleId int FOREIGN KEY REFERENCES BlogRole(RoleId)
		PRIMARY KEY (UserId, RoleId)
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogImage (
		ImageId int IDENTITY(1,1) PRIMARY KEY,
		ImageDescription nchar(50) NOT NULL,
		ImageData varbinary NOT NULL
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogPost (
		PostId int IDENTITY(1,1) PRIMARY KEY,
		Headline nchar(30) NOT NULL,
		Content nvarchar(MAX) NOT NULL
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogImageAssignment (
		PostId int FOREIGN KEY REFERENCES BlogPost(PostId),
		ImageId int FOREIGN KEY REFERENCES BlogImage(ImageId)
		PRIMARY KEY (PostId, ImageId)
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogTagAssignment (
		PostId int FOREIGN KEY REFERENCES BlogPost(PostId),
		TagId int FOREIGN KEY REFERENCES BlogTag(TagId)
		PRIMARY KEY (PostId, TagId)
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogCategoryAssignment (
		PostId int FOREIGN KEY REFERENCES BlogPost(PostId),
		CategoryId int FOREIGN KEY REFERENCES BlogCategory(CategoryId)
		PRIMARY KEY (PostId, CategoryId)
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogAction (
		ActionId int IDENTITY(1,1) PRIMARY KEY,
		ActionName nchar(30) NOT NULL
	) ON [PRIMARY];

	CREATE TABLE dbo.BlogLogEntry (
		LogId int IDENTITY(1,1) PRIMARY KEY,
		LogDate datetime,
		PostId int FOREIGN KEY REFERENCES BlogPost(PostId),
		ActionId int FOREIGN KEY REFERENCES BlogAction(ActionId),
		StateId int FOREIGN KEY REFERENCES BlogState(StateId),
		UserId int FOREIGN KEY REFERENCES BlogUser(UserId),
	) ON [PRIMARY];
	
	IF @@ERROR <> 0 
		BEGIN
			ROLLBACK TRANSACTION CreateTransaction;
		END
	ELSE
		BEGIN
			COMMIT TRANSACTION CreateTransaction;
		END;
END

