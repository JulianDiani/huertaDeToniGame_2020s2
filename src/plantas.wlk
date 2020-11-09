import toni.*
import pachamama.*
class Maiz {
	var property esBebe=true
	var property position=toni.position()
	
	method image() {
		// Modificar esto para que la imagen dependa del estado.
		return "maiz_bebe.png"
	}
	method regar(){
		esBebe=false
	}
	method listoParaLaCosecha(){
		return not esBebe
	}
	method precio(){return 150}
	method libreGluten(){return false}
	method esPlanta(){return true}
	
	
}
class Trigo{
	var property etapaEvolucion=0
		var property position=toni.position()
	method regar(){
		if(etapaEvolucion>3){
			etapaEvolucion+=1
		}else{
			etapaEvolucion=0
		}
	}
	method listoParaLaCosecha(){
		return etapaEvolucion>=2
	}
	method precio(){
		return if(etapaEvolucion==2){100}else{200}
	}
	method libreGluten(){return true}
	method esPlanta(){return true}
}
class Tomaco{
	var property esPlanta=true
		var property position=toni.position()
	method regar(){}
	method listoParaLaCosecha(){return true}
	method libreGluten(){return true}
	method esPlanta(){return true}
}