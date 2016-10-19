db.City.insert({CityZipCode: "6400", CityName: "Soenderborg"})
db.City.insert({CityZipCode: "7400", CityName: "Herning"})
db.City.insert({CityZipCode: "7430", CityName: "Ikast"})
db.City.insert({CityZipCode: "8000", CityName: "Aarhus C"})
db.City.insert({CityZipCode: "8100", CityName: "Aarhus C"})
db.City.insert({CityZipCode: "8200", CityName: "Aarhus N"})
db.City.insert({CityZipCode: "8210", CityName: "Aarhus V"})
db.City.insert({CityZipCode: "8260", CityName: "Viby J"})
db.City.insert({CityZipCode: "8600", CityName: "Silkeborg"})
db.City.insert({CityZipCode: "9000", CityName: "Aalborg"})
db.City.insert({CityZipCode: "9900", CityName: "Frederikshavn"})

db.Person.insert({PersonUserName: "bm", PersonFirstName: "Brian", PersonLastName: "Munksgaard", PersonEmail: "brian.munksgaard@gmail.com", PersonBirthday: ISODate("19690918"), Password: "Databaser2015"})
db.Person.insert({PersonUserName: "em", PersonFirstName: "Emil", PersonLastName: "Munksgaard", PersonEmail: "emil.munksgaard@gmail.com", PersonBirthday: ISODate("20001224")})
db.Person.insert({PersonUserName: "lm", PersonFirstName: "Lucas", PersonLastName: "Munksgaard", PersonEmail: "lucas.munksgaard@gmail.com", PersonBirthday: ISODate("20001224")})
db.Person.insert({PersonUserName: "mm", PersonFirstName: "Mikkel", PersonLastName: "Munksgaard", PersonEmail: "mikkelm.munksgaard@gmail.com", PersonBirthday: ISODate("20001224")})

db.CourseGroup.insert({CourseGroupName: "Musik", CourseParentGroup: ""})
db.CourseGroup.insert({CourseGroupName: "Outdoor", CourseParentGroup: ""})
db.CourseGroup.insert({CourseGroupName: "Guitar", CourseParentGroup: "Musik"})
db.CourseGroup.insert({CourseGroupName: "Trommer", CourseParentGroup: "Musik"})
db.CourseGroup.insert({CourseGroupName: "Sejllads", CourseParentGroup: "Outdoor"})
db.CourseGroup.insert({CourseGroupName: "MTB", CourseParentGroup: "Outdoor"})
db.CourseGroup.insert({CourseGroupName: "Golf", CourseParentGroup: "Outdoor"})
db.CourseGroup.insert({CourseGroupName: "Kajak", CourseParentGroup: "Sejllads"})
db.CourseGroup.insert({CourseGroupName: "Sejlbåd", CourseParentGroup: "Sejllads"})
db.CourseGroup.insert({CourseGroupName: "Motorbåd", CourseParentGroup: "Sejllads"})

db.Course.insert({CourseTitle: "Guitarundervisning for begyndere",
	              CourseDescription: "Vil du lære at spille guitar? Så se her :-). Jeg er 25 år bor og studerer i Århus. Jeg har spillet guitar i 15 år og har lyst til at lære fra mig. Jeg foretrækker du selv er studerende og nogenlunde på samme alder som jeg (mellem 20 og 30).",
	              CoursePrerequisites: "Du skal have din egen guitar.",
	              CoursePriceHour: 25,
	              CourseMaxAttendess: 2,
	              CourseStartDate: ISODate("20160107"),
	              CourseEndDate: ISODate("20160512"),
	              CourseIsActive: true,
	              CourseGroupName: "Guitar",
	              TeacherUserName: "em",
				  Location: {
					  LocationName: "Erhversakademi Århus, Basement",
					  LocationStreet: "Sønderhøj",
					  LocationStreetNumber: 30,
					  LocationZipCode: "8260"
				  },
				  CourseLesson: [
					{ CourseDay: 3, CourseStartTime: "18:00:00", CourseEndTime: "20:00:00"},
					{ CourseDay: 5, CourseStartTime: "18:00:00", CourseEndTime: "20:00:00"},
	              ],
				  Attending: [{UserName: "mm"}]
})

db.Course.insert({CourseTitle: "Sejllads for begyndere og let øvede",
	              CourseDescription: "Har du en drøm, om at lære at sejle, men synes du det er for svært at komme igang? Er du bange for, for meget teori og for lidt praktisk sejllads? Har du allerede en båd, men har ikke rigtig lært at sejle den? Nu har du muligheden for at komme i gang på helt uformelt plan :-) Jeg har sejlet i mange år og vil gerne hjælpe andre i gang med at sejle. Vi fokuserer på praktisk sejllads og sømandskab, så du hurtigt finder ud af, om det er noget for dig.",
	              CoursePrerequisites: "Du skal have din egen redningsvest, varmt udetøj og lidt gå på mod. Vi sejler i næsten al slags vejr.",
	              CoursePriceHour: 50,
	              CourseMaxAttendess: 3,
	              CourseStartDate: ISODate("20160107"),
	              CourseEndDate: ISODate("20160512"),
	              CourseIsActive: true,
	              CourseGroupName: "Sejlbåd",
	              TeacherUserName: "bm",
				  Location: {
					  LocationName: "Silkeborg Sejlkub",
					  LocationStreet: "Hattenæs",
					  LocationStreetNumber: 2,
					  LocationZipCode: "8600"
				  },
				  CourseLesson: [
					{ CourseDay: 4, CourseStartTime: "18:00:00", CourseEndTime: "20:00:00"},
					{ CourseDay: 7, CourseStartTime: "10:00:00", CourseEndTime: "13:00:00"},
	              ],
				  CourseTag: [ {TagName: "SAILINGTHESEA"}, {TagName: "LIVINGTHEDREAM"}],
				  Attending: [{UserName: "em"}, {UserName: "lm"}],
				  Review: [
				  	{ReviewDate: ISODate("20160312"), Rating: 5, ReviewText: "Super duper fantastic sailing course.", ReviewUserName: "em"},
					{ReviewDate: ISODate("20160212"), Rating: 5, ReviewText: "Nice sailing course.", ReviewUserName: "lm"}
				  ]
})

db.Course.insert({CourseTitle: "Golf for begyndere og let øvede",
	              CourseDescription: "Hej, jeg er en garvet golfspiller, som har lyst til at lære andre, at spille golf. Så har jeg jo også nogen at spille med :-) Er det noget for dig, er du meget velkommen til at kontakte mig.",
	              CoursePrerequisites: "Ingen til at starte med, du låner udstyr af mig. Med tiden skal du dog anskaffe dig dit eget.",
	              CoursePriceHour: 30,
	              CourseMaxAttendess: 2,
	              CourseStartDate: ISODate("20160107"),
	              CourseEndDate: ISODate("20160512"),
	              CourseIsActive: true,
	              CourseGroupName: "Golf",
	              TeacherUserName: "lm",
				  Location: {
					  LocationName: "Ikast Golfklub",
					  LocationStreet: "Remmevej",
					  LocationStreetNumber: 36,
					  LocationZipCode: "7430"
				  },
				  CourseLesson: [
					{ CourseDay: 7, CourseStartTime: "10:00:00", CourseEndTime: "12:00:00"},
	              ],
				  CourseTag: [{TagName: "MEGASWAGGOLFING"}, {TagName: "CRAP"}, {TagName: "NICE"}],
				  Attending: [{UserName: "lm"}],
				  Review: [
					{ReviewDate: ISODate("20160210"), Rating: 5, ReviewText: "Great golf course, great teacher.", ReviewUserName: "mm"}
				  ]
})
