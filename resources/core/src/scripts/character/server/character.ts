class Character {
	id: Number;
	userid: Number;
	firstname: String;
	lastname: String;
	dob: Number;
	gender: Number;
	appearance: String;
	created: Number;
	lastplayed: Number;

	constructor(userid, firstname, lastname, dob, gender, appearance, created) {
		this.userid = userid;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dob = dob;
		this.gender = gender;
		this.appearance = appearance;
		this.created = created
	}

	setLastPlayed() : Number {
		this.lastplayed = new Date().getTime()
		return this.lastplayed
	}

	getGender() : String {
		if ( this.gender === 1 )
			return "Female"
		return "Male"
	}
}

export { Character }