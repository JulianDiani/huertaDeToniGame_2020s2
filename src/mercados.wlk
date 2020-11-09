import toni.*
class Mercado{
	var property cantidadDeMonedas=0
	var property mercaderia=[]
	var property position
	method image(){return "mercado.png"}
	method comprar(){
		toni.plantasCosechadas().forEach({p=>mercaderia.add(p)
			cantidadDeMonedas-=p.precio()
		})
		toni.venderCosecha()
		
	}
	method esPlanta(){return false}
}