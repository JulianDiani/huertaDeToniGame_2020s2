import wollok.game.*
object pachamama {
	var property nivelDeAgradecimiento=10
var property position = game.at(0, 0)
	method image() {
		return if(self.estaAgradecida()){"pachamama-agradecida.png"}else{"pachatriste.png"}
	}
	method llover(){nivelDeAgradecimiento+=5}
	method fumigar(){nivelDeAgradecimiento=0}
	method estaAgradecida(){return nivelDeAgradecimiento>=10}
	method moverse(){
		if(not self.estaEnElBordeDer()){position=self.position().right(7)}
		else{position=self.position().left(14)}
	}
	method estaEnElBordeDer() {
		return (0 .. game.width()).any({y=> self.position()==game.at(game.width()-1, y)})
	
}

}
