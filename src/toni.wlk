import wollok.game.*
import plantas.*
import pachamama.*

object toni {
	const property image = "toni.png"
	var property plantasSembradas=[]
	var property plantasCosechadas=[]
	var property oroTotal=0
	var property position = game.at(3, 3)
	
	method sembrar(planta){
		if (game.colliders(self).size()>0){
			self.error("Ya hay una planta")
			} else {
			plantasSembradas.add(planta)
			game.addVisual(planta)
		}
	}
	method regarLasPlantas(){
		plantasSembradas.forEach({p=>
			if(p.esPlanta()){
				p.regar()
			}else{
				self.error("esto no es una planta")
			}
		})
	}
	method plantasListasParaCosechar(){
		return plantasSembradas.filter({p=>p.listoParaLaCosecha()})
	}
	method cosechar(planta){
		if(planta.listoParaLaCosecha()){
		plantasSembradas.remove(planta)
		game.removeVisual(planta)
		plantasCosechadas.add(planta)}else if(not planta.listoParaLaCosecha()){
			self.error("no esta lista para ser cosechada")
		}else{
			self.error("no hay ninguna planta aqui.")
		}
	}
	method cosecharTodo(){
		plantasSembradas.forEach({p=>self.cosechar(p)})
	}
	method vender(planta){
		oroTotal+=planta.precio()
		plantasCosechadas.remove(planta)
	}
	method venderCosecha(){
		plantasCosechadas.forEach({p=>self.vender(p)})
	}
	method paraCuantosDiasLeAlcanza(){
		const gastoDiario = 200
		return (plantasCosechadas.sum({p=>p.precio()})+oroTotal)/gastoDiario
	}
	method cuantosHayParaCeliacos(){
		return self.plantasListasParaCosechar().filter({p=>p.libreGluten()}).size()
	}
	method convieneRegar(){
		return plantasSembradas.any({p=>not p.listoParaLaCosecha()})
	}
	method estaEnElBordeIzq() {
		return (0 ..game.width()).any({y=>self.position()==game.at(0, y)})
	}
	method estaEnElBordeDer() {
		return (0 .. game.width()).any({y=> self.position()==game.at(game.width()-1, y)})
	}
	method estaEnElBordeSup() {
		return (0 .. game.height()).any{x=>self.position()==game.at(x, game.height()-1)}
	}
	method estaEnElBordeInf() {
		return (0 .. game.height()).any{x=>self.position()==game.at(x, 0)}
	}
	method caminarHaciaArriba(){
		if(not self.estaEnElBordeSup()){
			position=self.position().up(1)
		}else{
			position=self.position().down(game.height()-1)
		}
	}
	method caminarHaciaAbajo(){
		if(not self.estaEnElBordeInf()){
			position=self.position().down(1)
		}else{
			position=self.position().up(game.height()-1)
		}
	}
	method caminarHaciaLaIzq(){
		if(not self.estaEnElBordeIzq()){
			position=self.position().left(1)
		}else{
			position=self.position().right(game.width()-1)
		}
	}
	method caminarHaciaLaDer(){
		if(not self.estaEnElBordeDer()){
			position=self.position().right(1)
		}else{
			position=self.position().left(game.width()-1)
		}
	}
	method sacarPlanta(planta){
		plantasSembradas.remove(planta)
		game.removeVisual(planta)
	}
	method hacerOfrendaALaPacha(){
		if(not pachamama.estaAgradecida()&&plantasSembradas.size()>0){
			self.sacarPlanta(plantasSembradas.anyOne())
			pachamama.nivelDeAgradecimiento(10)
			pachamama.moverse()
		}else if(pachamama.estaAgradecida()&&plantasSembradas.size()>0){
			pachamama.llover()
			self.sacarPlanta(plantasSembradas.anyOne())
			self.regarLasPlantas()
			pachamama.moverse()
		}
	}
	
}