USE BlogDB;

EXEC dbo.AddBlogEntry
	@UserId = 1, -- Brian
	@CategoryId = 3, -- Jolle
	@Headline = 'Europa',
	@Content = 'Europajollen (ogs� kendt som E-jolle, Europa eller Europe) er en jolletype, der er ideel for sejlere, der er vokset ud af optimistjollen. Skroget er bygget af glasfiber og vejer min. 45 kg, og 60 kg fuldt rigget. Jollen er spids i st�vnen, rund i bunden, 3,35 m lang og 1,38 m bred. Sejlet er 7,1 m� og bygget af PET.';

