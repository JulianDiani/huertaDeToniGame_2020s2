import toni.*
import pachamama.*
class Maiz {
	var property esBebe=true
	var property position=toni.position()
	
	method image() {
		return if (esBebe){"maiz_bebe.png"}else{"maiz_adulto.png"}
	}
	method regar(){
		esBebe=false
	}
	method listoParaLaCosecha(){
		return not esBebe
	}
	method precio(){
		return if(pachamama.estaAgradecida()){
			180
		}else{150}
	}
	method libreGluten(){return false}
	method esPlanta(){return true}
	
	
}
class Trigo{
	var property etapaEvolucion=0
		var property position=toni.position()
	method image(){
	if(etapaEvolucion==0){return "trigo_0.png"}
	else if(etapaEvolucion==1){return "trigo_1.png"}
	else if (etapaEvolucion==2){return "trigo_2.png"}
	else{return "trigo_3.png"}
	}
	method regar(){
			if(pachamama.estaAgradecida()&& etapaEvolucion<2){etapaEvolucion+=2}
			else if(not pachamama.estaAgradecida()&& etapaEvolucion<3){
				etapaEvolucion+=1
			}else{etapaEvolucion=0}
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
	method image(){
		return if(self.listoParaLaCosecha()){"tomaco_ok.png"}else{"tomaco_podrido.png"}
	}
	method regar(){}
	method listoParaLaCosecha(){return not pachamama.estaAgradecida()}
	method libreGluten(){return true}
	method esPlanta(){return true}
	method precio(){return 80}
}