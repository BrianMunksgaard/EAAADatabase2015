USE SenseiDB;

EXEC dbo.CreateCourse
	@CourseTitle = 'Guitarundervisning for begyndere',
	@CourseDescription = 'Vil du lære at spille guitar? Så se her :-). Jeg er 25 år bor og studerer i Århus. Jeg har spillet guitar i 15 år og har lyst til at lære fra mig. Jeg foretrækker du selv er studerende og nogenlunde på samme alder som jeg (mellem 20 og 30).',
	@CoursePrerequisites = 'Du skal have din egen guitar.',
	@CoursePriceHour = 25,
	@CourseMaxAttendess = 2,
	@CourseStartDate = '20160107',
	@CourseEndDate = '20160512',
	@CourseIsActive = 1,
	@CourseGroupId = 3,
	@TeacherUserName = 'em',
	@LocationName = 'Erhversakadem Århus, Basement',
	@LocationStreet = 'Sønderhøj',
	@LocationStreetNumber = 30,
	@LocationZipCode = '8260'

EXEC dbo.CreateCourse
	@CourseTitle = 'Sejllads for begyndere og let øvede',
	@CourseDescription = 'Har du en drøm, om at lære at sejle, men synes du det er for svært at komme igang? Er du bange for, for meget teori og for lidt praktisk sejllads? Har du allerede en båd, men har ikke rigtig lært at sejle den? Nu har du muligheden for at komme i gang på helt uformelt plan :-) Jeg har sejlet i mange år og vil gerne hjælpe andre i gang med at sejle. Vi fokuserer på praktisk sejllads og sømandskab, så du hurtigt finder ud af, om det er noget for dig.',
	@CoursePrerequisites = 'Du skal have din egen redningsvest, varmt udetøj og lidt gå på mod. Vi sejler i næsten al slags vejr.',
	@CoursePriceHour = 50,
	@CourseMaxAttendess = 3,
	@CourseStartDate = '20160107',
	@CourseEndDate = '20160512',
	@CourseIsActive = 1,
	@CourseGroupId = 9,
	@TeacherUserName = 'bm',
	@LocationName = 'Silkeborg Sejlkub',
	@LocationStreet = 'Hattenæs',
	@LocationStreetNumber = 2,
	@LocationZipCode = '8600'


EXEC dbo.CreateCourse
	@CourseTitle = 'Gold for begyndere og let øvede',
	@CourseDescription = 'Hej, jeg er en garvet golfspiller, som har lyst til at lære andre, at spille golf. Så har jeg jo også nogen at spille med :-) Er det noget for dig, er du meget velkommen til at kontakte mig.',
	@CoursePrerequisites = 'Ingen til at starte med, du låner udstyr af mig. Med tiden skal du dog anskaffe dig dit eget.',
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

