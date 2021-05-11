let Connected = false

onNet("playerSpawned", () => {
	if ( !Connected ) {
		emitNet("core:playerConnected", GetPlayerServerId(PlayerId()))
		Connected = true
	}
})