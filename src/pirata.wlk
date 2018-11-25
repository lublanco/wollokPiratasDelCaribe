import jack.*

class Pirata{

	var property energia
	
	method resultadoDeTomarRon(jack){
		energia -= 50
	}
}

class Guerrero inherits Pirata{

	var property poderDePelea
	var property vitalidad

	constructor(unaEnergia, valorPoderDePelea, unaVitalidad){
		energia = unaEnergia
		poderDePelea = valorPoderDePelea
		vitalidad = unaVitalidad
	}


	 method poderDeMando(){
		return poderDePelea * vitalidad
	}

	override method resultadoDeTomarRon(jack){
		energia -= 50
	}

	method devilitar(){
		poderDePelea = poderDePelea / 2
	}

}

class Navegador inherits Pirata{

	var property inteligencia
	
	constructor(unaEnergia, valorInteligencia){
		energia = unaEnergia
		inteligencia = valorInteligencia
	}


	method poderDeMando(){
		return inteligencia * inteligencia
	}
	
	override method resultadoDeTomarRon(jack){
		energia -= 50
	}

	method devilitar(){
		inteligencia = inteligencia / 2
	}
}

class Cocinero inherits Pirata{

	var property moral
	var property ingredientes

	constructor(unaEnergia, cantidadDeMoral,unosIngredientes){
		energia = unaEnergia
		moral = cantidadDeMoral
		ingredientes = unosIngredientes
	}

	method poderDeMando(){
		return moral * ingredientes.size()
	}

	override method resultadoDeTomarRon(jack){
		energia -= 50
		self.esRobadoPorJack(jack, self.sacarIngredienteAlAzar())
	}

	method esRobadoPorJack(jack, ingrediente){
		ingredientes.delete(ingrediente)
		jack.agregarIngredienteRobado(ingrediente)
	}

	method sacarIngredienteAlAzar(){
		return ingredientes.sample()
	}

	method devilitar(){
		moral = moral / 2
	}
}

class Monstruo inherits Pirata{
	
	var property poderDePelea

	constructor(unaEnergia, unPoderDePelea){
		energia = unaEnergia
		poderDePelea = unPoderDePelea
	}

	 method poderDeMando(){ 
		return poderDePelea
	}
}