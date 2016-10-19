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
	 'Hexia de Trick er en ond troldkvinde i Disney-tegneserier, hun hed oprindelig Magica Pokus. Hun blev opfundet af Carl Barks, og vi kunne f�rste gang se hende i historien The Midas Touch fra Uncle Scrooge nr. 36; f�rste gang i Anders And & Co: Nr. 6/63 i historien Onkel Joakim "glaserer" sin pengetank, hvor det oprindelige danske navn skulle v�re Magika Pokus [1]. If�lge Barks bor Hexia ved foden af vulkanen Vesuv (hvilket i danske overs�ttelser er blevet til Vesuvio, da den danske redaktion sj�ldent tillod brug af virkelige stednavne), hvor Joakim von And har udstationeret faste vagter til at holde �je med hende. Hun er, p� trods af sit danske navn, ikke en heks og har s�ledes ikke medf�dte magiske evner men m� ty til magiske formularer og tryllestave. Hexias st�rste m�l i livet er at f� fingrene i Joakim von Ands f�rste 25-�re, da hun vil smelte den om til en magisk amulet, som giver hende alverdens rigdomme. Den lader hende f� magten til at lave guld bare ved at r�re ved et eller andet, Hun er derfor sj�ldent (om nogensinde) ude efter pengene i Joakim von And pengetank og har p� den vis flere gange indg�et aftaler med Bj�rne-banden om f�lles front mod Joakim betinget af "ligelig" fordeling af rovet � de f�r pengene, hun f�r 25-�ren. Hun har derudover en hj�lper i sin sorte ravn Rasputin, som hun ofte har tryllet om til alverdens skabninger i sin higen efter Lykkem�nten. Hendes vel nok mest anvendte v�ben mod Joakim er de s�kaldte puff-bomber, hun altid har med i h�ndtasken, og som midlertidigt paralyserer og bl�nder fjenden.',
	 0); /* No image */

INSERT INTO dbo.Post (EntryTime, UserId, StateId, Headline, Content, ImageId)
VALUES(
	GETDATE(), /* Current Date */
	 2, /* Anders And */
	 1, /* Draft */
	 'Anden Anders And',
	 'Anders And er en ber�mt figur i Disneys tegnefilm og tegneserier. Selv om han ikke er s�rligt popul�r i USA, optr�der han i mange ugeblade i Europa.',
	 0); /* No image */

DELETE FROM dbo.TagAssignment;
INSERT INTO dbo.TagAssignment (PostId, TagId)
VALUES
	(1, 4), /* Ond */
	(1, 9), /* f�rste25�re */
	(2, 3); /* Uheldig */

DELETE FROM dbo.CategoryAssignment;
INSERT INTO dbo.CategoryAssignment (PostId, CategoryId)
VALUES
	(1, 1), /* And */
	(2, 1); /* And */


