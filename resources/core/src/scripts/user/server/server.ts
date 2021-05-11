import { User } from "./user"

const Users = []

interface IList {
	[name: string]: string;
}

function GetIds(src) {
	const ids: IList = {}

	for (let i = 0; i < GetNumPlayerIdentifiers(src); i++) {
		const data = GetPlayerIdentifier(src, i).split(':');

		if (data.length > 0)
			ids[data[0]] = data[1];
	}
	return ids
}

on('playerConnecting', (name, reject, def, source) => {
	console.log("Player connecting")
	const identifiers = GetIds(source)
	if ( identifiers["steam"] === "" ) {
		reject("Steam is not currently running! Steam is required to connect...")
		CancelEvent()
		return
	}
})


onNet("core:playerConnected", function(source) {
	const identifiers = GetIds(source)
	global.exports.ghmattimysql.execute("SELECT * FROM users WHERE steam = ? and license = ?", 
	[ parseInt(identifiers["steam"], 16), identifiers["license"] ], (result) => {
		if(result[0] != null) {
			global.exports.ghmattimysql.execute("UPDATE users SET lastplayed = CURRENT_TIMESTAMP()", [], (update) => {
				Users[source] = new User(result.id, result.steam, result.license, result.ip, result.name, result.created)
				Users[source].setLastPlayed(update.lastplayed)
			})
		} else {
			global.exports.ghmattimysql.execute("INSERT INTO users ( steam, license, ip, name ) VALUES ( ?, ?, ?, ? )",
			[ parseInt(identifiers["steam"], 16), identifiers["license"], identifiers["ip"], GetPlayerName(source) ], (user) => {
				Users[source] = new User(user.id, user.steam, user.license, user.ip, user.name, user.created)
				Users[source].setLastPlayed(result.lastplayed)
			})
		}
	});
})