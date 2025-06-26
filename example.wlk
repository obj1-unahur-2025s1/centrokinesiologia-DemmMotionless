class Paciente {
  const aparatosAUsar = []
  const property edad
  var property fortalezaMuscular
  var nivelDolor

  method nivelDolor(unNivel) {
    nivelDolor = unNivel
  }

  method nivelDolor() = nivelDolor
  method puedeUsarAparato(unAparato) = unAparato.puedeSerUsadoPor(self)

  method usarAparato(unAparato) {
    if(self.puedeUsarAparato(unAparato)){
      unAparato.usarPor(self)
    }
  }

  method agregarAparato(unAparato) {
    aparatosAUsar.add(unAparato)
  }

  method aparatosAUsar() = aparatosAUsar
  method puedeHacerRutina() = aparatosAUsar.all({a => self.puedeUsarAparato(a)})

  method realizarRutina() {
    aparatosAUsar.forEach({a => self.usarAparato(a)})
  }
}

class Magneto {
  var property color = "blanco"

  method puedeSerUsadoPor(unPaciente) = true

  method usarPor(unPaciente) {
    unPaciente.nivelDolor(unPaciente.nivelDolor() - (unPaciente.nivelDolor() * 0.1))
  }
}

class Bicicleta {
  var property color = "blanco"
  
  method puedeSerUsadoPor(unPaciente) = unPaciente.edad() > 8

  method usarPor(unPaciente) {
    unPaciente.nivelDolor(unPaciente.nivelDolor() - 4)
    unPaciente.fortalezaMuscular(unPaciente.fortalezaMuscular() + 3)
  }
}

class Minitramp {
  var property color = "blanco"
  method puedeSerUsadoPor(unPaciente) = unPaciente.nivelDolor() < 20

  method usarPor(unPaciente) {
    unPaciente.fortalezaMuscular(unPaciente.fortalezaMuscular() + (unPaciente.edad() * 0.1))
  }
}

class Resistente inherits Paciente {
  override method realizarRutina() {
    super() 
    fortalezaMuscular = fortalezaMuscular + aparatosAUsar.size()
  }
}

class Caprichoso inherits Paciente {
  override method puedeHacerRutina() = super() && aparatosAUsar.any({a => a.color() == "rojo"})

  override method realizarRutina() {
    aparatosAUsar.forEach({a => self.usarAparato(a)})
    aparatosAUsar.forEach({a => self.usarAparato(a)})
  }
}

class RapidaRecuperacion inherits Paciente{
  override method nivelDolor(unNivel) {
    nivelDolor = unNivel
  }
}