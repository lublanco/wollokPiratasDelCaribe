class Barco{

	var property bando
	var property resistencia
	var property poderDeFuego
	var property municion
	var property tripulacion

	constructor(unaResistencia, unPoderDeFuego, unaMunicion, unaTripulacion){
		resistencia = unaResistencia
		poderDeFuego = unPoderDeFuego
		municion = unaMunicion
		tripulacion = unaTripulacion
		bando = null
	}


	method capitanDeBarco(){
		return tripulacion.max({unPirata => unPirata.poderDeMando()})
	}

	method combateCon(otroBarco){
		if (self.fuerzaDeBarco()>= otroBarco.fuerzaDeBarco()){
			self.resultadosBatalla(otroBarco)
		}else{
			otroBarco.resultadosBatalla(self)
		}
	}

	method fuerzaDeBarco(){
		return tripulacion.sum({unPirata => unPirata.poderDeMando()})	
	}

	method devilitarTripulacion(){
		tripulacion.forEach({pirata => pirata.devilitar()})
	}

	method incorporarFuertes(otroBarco){
		tripulacion = tripulacion + otroBarco.tripulacion().filter({unPirata => unPirata.poderDeMando() > 100}) 
	}

	method resultadosBatalla(otroBarco){
		otroBarco.devilitarTripulacion()
		self.incorporarFuertes(otroBarco)
		otroBarco.tirarseAlAgua()
	}

	method tirarseAlAgua(){
		tripulacion = []
	}

	method barcoDesolado(){
		resistencia = 0
		poderDeFuego = 0
		municion = 0
	}

	method dispararA(cantidadDeBalas,unBarco){
		if (municion >= cantidadDeBalas){
			unBarco.disminuirResistencia(cantidadDeBalas * 50)	
			unBarco.eliminarLosDeBajaEnergia()
			municion = (municion - cantidadDeBalas).max(0)
		}else{
			self.error("fallo Disparo")
			municion = (municion - cantidadDeBalas).max(0)
			}
		}

	

	method disminuirResistencia(unaCantidad){
		resistencia = (resistencia - unaCantidad).max(0)
	}

	method eliminarLosDeBajaEnergia(){
		tripulacion = self.tripulacion().filter({unPirata => unPirata.devolverEnergia() > 20}) 
	}

	method elegir(unBando){
		bando = unBando
		unBando.aplicarBandoA(self)
	}

	method modificarMunicion(cantidad){
		municion = municion + cantidad
	}
	
	method modificarPoderDeFuego(cantidad){
		poderDeFuego += cantidad
	}

	method duplicarTripulacion(){
		tripulacion = tripulacion + tripulacion
	}

	method cambiarBando(unBando){
		self.quitarBando(bando)
		self.elegir(unBando)
	}

	method quitarBando(unBando){
		unBando.quitarBono(self)
	}

	method quitarRepetidos(){
		tripulacion = tripulacion.asSet().asList()
	}
}
