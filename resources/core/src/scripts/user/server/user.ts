import { timeStamp } from "console";

class User {
	id: number;
	steam: string;
	license: string;
	ip: string;
	name: string;
	created: number;
	lastplayed: number;

	constructor(id: number, steam: string, license: string, ip: string, name: string, created: number) {
		this.id = id;
		this.steam = steam;
		this.license = license;
		this.ip = ip;
		this.name = name;
		this.created = created;
	}

	setLastPlayed() : number {
		this.lastplayed = new Date().getTime()
		return this.lastplayed
	}
}

export { User }