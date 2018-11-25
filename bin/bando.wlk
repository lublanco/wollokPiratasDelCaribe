

class Bando{
}

object armadaInglesa inherits Bando{

	method aplicarBandoA(unBarco){
		unBarco.modificarMunicion(+(unBarco.municion() * 0.30))
	}

	method quitarBono(unBarco){
		unBarco.modificarMunicion(-(unBarco.municion() * 0.30))
	}
}

object unionPirata inherits Bando{

	method aplicarBandoA(unBarco){
		unBarco.modificarPoderDeFuego(60)
	}

	method quitarBono(unBarco){
		unBarco.modificarPoderDeFuego(-60)
	}
}

object holandesErrante inherits Bando{

	method aplicarBandoA(unBarco){
		unBarco.duplicarTripulacion()
	}

	method quitarBono(unBarco){
		unBarco.quitarRepetidos()
	}
}