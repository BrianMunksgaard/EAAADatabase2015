USE BlogDB;

EXEC dbo.AddBlogEntry
	@UserId = 1, -- Brian
	@CategoryId = 3, -- Jolle 
	@Headline = 'Optimist',
	@Content = 'Optimistjolle, også kaldet optimisten eller optien, er standarden for enmandsjoller, og er generelt den mest udbredte og hurtigst voksende jolletype. Oftest starter man med at sejle den, omkring 7-14 års alderen. Jollen styres og trimmes udelukkende med roret, sværdet, skødet, sprydstagen, bomnedhalet og sejlerens placering i båden. Optimistsejlerne blive delt op i A-, B-, og C-sejlere, hvor c-sejlere er de mindst øvede og a-sejlere er mest øvede.';
	
EXEC dbo.AddBlogEntry
	@UserId = 1, -- Brian
	@CategoryId = 3, -- Jolle
	@Headline = 'RS Tera',
	@Content = 'The RS Tera is suitable for introducing newcomers to the sport of sailing, but is also a good boat to race.[2] The boat is highly robust, and it is built with a self draining cockpit and is easy to right after a capsize, in addition to which it has a floating daggerboard. The boat is fairly small and light, meaning it is possible to transport on a roof rack, and that it is manageable on the water by younger children. The mast comes in two pieces, and the boom is padded. Furthermore, the RS Tera can be rowed and has oarlocks.[3] Built with a Comptec PE3 hull, the RS Tera has been described to have a modern look.';

EXEC dbo.AddBlogEntry
	@UserId = 1, -- Brian
	@CategoryId = 2, -- Kølbåd
	@Headline = 'J/70',
	@Content = 'The J/70 Speedster (22.75 feet) is J/Boats first ramp-launchable keelboat - designed to fulfill the growing need for an easy-to-own, high performance one-design that is exciting to sail, stable enough sailboat for the family, and built to last. With fleet discussions underway around the world, J/70 is on-track to take the world by storm.';

EXEC dbo.AddBlogEntry
	@UserId = 1, -- Brian
	@CategoryId = 3, -- Jolle
	@Headline = 'RS Feva',
	@Content = 'The RS Feva is a two-person sailing dinghy designed by Paul Handley in 2002. It is manufactured and distributed by RS Sailing.The RS Feva is an International Sailing Federation (ISAF) International Class, a Royal Yachting Association (RYA) Supported Junior Class, and has been selected by the Dansk Sejlunion (Danish Sailing Association) and Norges Seilforbund (Norwegian Sailing Federation) for major sailing growth projects.';

EXEC dbo.AddBlogEntry
	@UserId = 1, -- Brian
	@CategoryId = 3, -- Jolle
	@Headline = 'Laser',
	@Content = 'The Laser is one of the most popular single-handed dinghies in the world. As of 2012, there are more than 200,000 boats worldwide. A commonly cited reason for its popularity is that it is robust and simple to rig and sail in addition to its durability. The Laser also provides very competitive racing due to the very tight class association controls which eliminate differences in hull, sails and equipment.';

EXEC dbo.AddBlogEntry
	@UserId = 1, -- Brian
	@CategoryId = 8, -- Klub
	@Headline = 'Silkeborg Sejlklub',
	@Content = 'Klubben er en hyggelig lille sejlklub, hvor vi nyder sejlerlivets mange glæder på Silkeborgsøerne. Vi byder velkommen til enkeltpersoner, voksne som børn og familier. ';
