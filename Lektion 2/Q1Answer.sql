USE BlogDB;
GO

/* Answer to Q1 */
DELETE FROM dbo.Post;
INSERT INTO dbo.Post (EntryTime, UserId, StateId, Headline, Content, ImageId)
VALUES(
	GETDATE(), /* Current Date */
	 3, /* Hexia de Trick */
	 1, /* Draft */
	 'Troldkvinden Hexia de Trick',
	 'Hexia de Trick er en ond troldkvinde i Disney-tegneserier, hun hed oprindelig Magica Pokus. Hun blev opfundet af Carl Barks, og vi kunne første gang se hende i historien The Midas Touch fra Uncle Scrooge nr. 36; første gang i Anders And & Co: Nr. 6/63 i historien Onkel Joakim "glaserer" sin pengetank, hvor det oprindelige danske navn skulle være Magika Pokus [1]. Ifølge Barks bor Hexia ved foden af vulkanen Vesuv (hvilket i danske oversættelser er blevet til Vesuvio, da den danske redaktion sjældent tillod brug af virkelige stednavne), hvor Joakim von And har udstationeret faste vagter til at holde øje med hende. Hun er, på trods af sit danske navn, ikke en heks og har således ikke medfødte magiske evner men må ty til magiske formularer og tryllestave. Hexias største mål i livet er at få fingrene i Joakim von Ands første 25-øre, da hun vil smelte den om til en magisk amulet, som giver hende alverdens rigdomme. Den lader hende få magten til at lave guld bare ved at røre ved et eller andet, Hun er derfor sjældent (om nogensinde) ude efter pengene i Joakim von And pengetank og har på den vis flere gange indgået aftaler med Bjørne-banden om fælles front mod Joakim betinget af "ligelig" fordeling af rovet – de får pengene, hun får 25-øren. Hun har derudover en hjælper i sin sorte ravn Rasputin, som hun ofte har tryllet om til alverdens skabninger i sin higen efter Lykkemønten. Hendes vel nok mest anvendte våben mod Joakim er de såkaldte puff-bomber, hun altid har med i håndtasken, og som midlertidigt paralyserer og blænder fjenden.',
	 0); /* No image */

INSERT INTO dbo.Post (EntryTime, UserId, StateId, Headline, Content, ImageId)
VALUES(
	GETDATE(), /* Current Date */
	 2, /* Anders And */
	 1, /* Draft */
	 'Anden Anders And',
	 'Anders And er en berømt figur i Disneys tegnefilm og tegneserier. Selv om han ikke er særligt populær i USA, optræder han i mange ugeblade i Europa.',
	 0); /* No image */

DELETE FROM dbo.TagAssignment;
INSERT INTO dbo.TagAssignment (PostId, TagId)
VALUES
	(1, 4), /* Ond */
	(1, 9), /* første25øre */
	(2, 3); /* Uheldig */

DELETE FROM dbo.CategoryAssignment;
INSERT INTO dbo.CategoryAssignment (PostId, CategoryId)
VALUES
	(1, 1), /* And */
	(2, 1); /* And */


