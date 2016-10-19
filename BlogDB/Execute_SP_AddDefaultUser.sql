USE BlogDB;

-- Add Default User.
EXEC dbo.AddDefaultUser
	@UserFirstName = 'Sune',
	@UserLastName = 'Just',
	@UserEmail = 'sune.moesgaard.just@gmail.com';
