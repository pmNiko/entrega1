class Sesion
    attr_reader :estado_de_coneccion

    def initialize
      self.desconectar
    end

    def conectar
      @estado_de_coneccion = true
    end

    def desconectar
      @estado_de_coneccion = false
    end

end
