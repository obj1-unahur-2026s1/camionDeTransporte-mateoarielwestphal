object knightRider {
    method peso() = 500 
    method peligrosidad() = 10   

    method bulto() = 1  

    method consecuencia() {
      
    }
}

object bumblebee {
  var estaRobot = true 
  var estaAuto = false

  method estaAuto() = estaAuto
  method estaRobot() = estaRobot    
  method peso() = 800
  method peligrosidad() {
    var resultado = 0 
    if(self.estaRobot()){
        resultado = 30 
    }
    else{
        resultado = 15
    }
    return resultado
  } 

  method robot() {
    estaAuto = false 
    estaRobot = true 
  }

  method auto() {
    estaAuto = true 
    estaRobot = false 
  }

  method bulto() = 2

  method consecuencia() {
    self.robot()
  }  

}

object paqueteLadrillo {
  var cantidadLadrillo = 0 

  method peligrosidad() = 2 
  method peso() = cantidadLadrillo * 2  

  method asignarCantidad(cantidad) {
    cantidadLadrillo += cantidad
  }

  method bulto(){
    var resultado = 0 
    if(cantidadLadrillo <= 100){
        resultado = 1 
    }
    else if(cantidadLadrillo.between(101, 300)){
        resultado = 2 
    }
    else{
        resultado = 3 
    }
    return resultado
  }

  method consecuencia() {
    self.asignarCantidad(12)
  }  
}

object arenaGranel {
  var peso = 0 

  method peso() = peso
  method peligrosidad() = 1 

  method asignarPeso(peso_) {
    peso = peso_
  } 

  method bulto() = 1

  method consecuencia() {
    peso -= 10 
  }  
}

object bateriaAntiaerea {
  var tieneMisiles = false
  method tieneMisiles() = tieneMisiles

  method peso() {
    var resultado = 0 
    if(self.tieneMisiles()){
        resultado = 300 
    }
    else{
        resultado = 200 
    }
    return resultado
  }

  method peligrosidad() {
    var resultado = 0 
    if(self.tieneMisiles()){
        resultado = 100
    }
    else{
        resultado = 0 
    }
    return resultado
  }

  method conMisiles() {
    tieneMisiles = true 
  } 

  method sinMisiles() {
    tieneMisiles = false 
  }

  method bulto() {
    var resultado = 0 
    if(self.tieneMisiles()){
        resultado = 2 
    }
    else{
        resultado = 1 
    }
    return resultado
  }

  method consecuencia() {
    self.conMisiles()
  }
}

object contenedorPortuario {
  const cosas = []

  method peso() = self.sumaDeLasCosas() + 100
  method peligrosidad() {
    if(not cosas.isEmpty()){
        return cosas.max({cosa => cosa.peligrosidad()})
    }
    else{
        return 0 
    }
  }  

  method agregarCosa(cosa_) {
    cosas.add(cosa_)
  }

  method sumaDeLasCosas() {
    return cosas.sum({cosa => cosa.peso()})
  }

  method bultosDeCosa() = cosas.sum({cosa => cosa.bulto()})

  method bulto() = self.bultosDeCosa() + 1

  method consecuencia() {
    cosas.forEach({cosa => cosa.consecuencia()})
  } 
}


object residuosRadioctivos {
  var peso = 0

  method peligrosidad() = 200
  method peso() = peso    

  method asignarPeso(peso_) {
    peso = peso_ 
  }

  method sumarPeso(valor) {
    peso += valor 
  }

  method bulto() = 1

  method consecuencia() {
    self.sumarPeso(15)
  }  
}

object embalajeSeguridad {
  var cosa = arenaGranel 

  method peso() = cosa.peso()
  method peligrosidad() = cosa.peligrosidad() / 2  

  method asignarCosa(cosa_) {
    cosa = cosa_
  } 

  method bulto() = 2

  method consecuencia() {
    
  }  
}