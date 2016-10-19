USE SenseiDB;

EXEC dbo.CreateCourse
	@CourseTitle = 'Guitarundervisning for begyndere',
	@CourseDescription = 'Vil du l�re at spille guitar? S� se her :-). Jeg er 25 �r bor og studerer i �rhus. Jeg har spillet guitar i 15 �r og har lyst til at l�re fra mig. Jeg foretr�kker du selv er studerende og nogenlunde p� samme alder som jeg (mellem 20 og 30).',
	@CoursePrerequisites = 'Du skal have din egen guitar.',
	@CoursePriceHour = 25,
	@CourseMaxAttendess = 2,
	@CourseStartDate = '20160107',
	@CourseEndDate = '20160512',
	@CourseIsActive = 1,
	@CourseGroupId = 3,
	@TeacherUserName = 'em',
	@LocationName = 'Erhversakadem �rhus, Basement',
	@LocationStreet = 'S�nderh�j',
	@LocationStreetNumber = 30,
	@LocationZipCode = '8260'

EXEC dbo.CreateCourse
	@CourseTitle = 'Sejllads for begyndere og let �vede',
	@CourseDescription = 'Har du en dr�m, om at l�re at sejle, men synes du det er for sv�rt at komme igang? Er du bange for, for meget teori og for lidt praktisk sejllads? Har du allerede en b�d, men har ikke rigtig l�rt at sejle den? Nu har du muligheden for at komme i gang p� helt uformelt plan :-) Jeg har sejlet i mange �r og vil gerne hj�lpe andre i gang med at sejle. Vi fokuserer p� praktisk sejllads og s�mandskab, s� du hurtigt finder ud af, om det er noget for dig.',
	@CoursePrerequisites = 'Du skal have din egen redningsvest, varmt udet�j og lidt g� p� mod. Vi sejler i n�sten al slags vejr.',
	@CoursePriceHour = 50,
	@CourseMaxAttendess = 3,
	@CourseStartDate = '20160107',
	@CourseEndDate = '20160512',
	@CourseIsActive = 1,
	@CourseGroupId = 9,
	@TeacherUserName = 'bm',
	@LocationName = 'Silkeborg Sejlkub',
	@LocationStreet = 'Hatten�s',
	@LocationStreetNumber = 2,
	@LocationZipCode = '8600'


EXEC dbo.CreateCourse
	@CourseTitle = 'Gold for begyndere og let �vede',
	@CourseDescription = 'Hej, jeg er en garvet golfspiller, som har lyst til at l�re andre, at spille golf. S� har jeg jo ogs� nogen at spille med :-) Er det noget for dig, er du meget velkommen til at kontakte mig.',
	@CoursePrerequisites = 'Ingen til at starte med, du l�ner udstyr af mig. Med tiden skal du dog anskaffe dig dit eget.',
	@CoursePriceHour = 30,
	@CourseMaxAttendess = 2,
	@CourseStartDate = '20160107',
	@CourseEndDate = '20160512',
	@CourseIsActive = 1,
	@CourseGroupId = 7,
	@TeacherUserName = 'lm',
	@LocationName = 'Ikast Golfklub',
	@LocationStreet = 'Remmevej',
	@LocationStreetNumber = 36,
	@LocationZipCode = '7430'

