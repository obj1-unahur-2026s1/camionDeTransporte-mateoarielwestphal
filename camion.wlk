object camion {
     const cosas = []
    method tara() = 1000 

    method cargarCosa(cosa) {
      cosas.add(cosa)
    }

    method descargarCosa(cosa) {
      cosas.remove(cosa)
    }

    method hayAlgunPesoPar() = cosas.any({cosa => cosa.peso().even()})

    method hayCosaDePeso(peso) = cosas.any({cosa => cosa.peso() == peso})

    method cosaDeUnPeso(peligro) = cosas.find({cosa => cosa.peligrosidad() == peligro}) 

    method cosasQueSuperanPeligrosidad(cosa) = cosas.filter({cosa => cosa.peligrosidad() > cosa.peligrosidad()}) 

    method pesoDeCosa() = cosas.sum({cosa => cosa.peso()})

    method estaExedidoDePeso() = self.pesoDeCosa() + self.tara() > 2500 

    method puedeCircular(peligro) = not self.estaExedidoDePeso() and not cosas.any({cosa => cosa.peligrosidad() >= peligro and cosa.peligrosidad() <= peligro})

    method tieneCosaQuePesaMinMax(min,max) =   cosas.any({cosa => cosa.peso().between(min, max)})

    method cosaMasPesada() = cosas.max({cosa => cosa.peligrosidad()})
}