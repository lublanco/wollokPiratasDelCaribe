import pirata.*
import bando.*

object jack{

		var property energia = 500
		var property poderDePelea = 200
		var property inteligencia = 300
		var property ingredientes = ["ron"]


	method poderDeMando(){
		return energia * poderDePelea * inteligencia
	}

	method tomarRonCon(unPirata){
		energia += 100
		unPirata.resultadoDeTomarRon(self)
	}

	method agregarIngredienteRobado(ingredienteRobado){
		ingredientes.add(ingredienteRobado)
	}
}