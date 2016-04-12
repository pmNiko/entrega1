class Sesion
    attr_reader :estado_de_coneccion, :usuario_actual
    attr_writer :usuario_actual

    def initialize
      self.desconectar
    end

    def conectar_con(nick)
      @estado_de_coneccion = true
      @usuario_actual = nick
    end

    def desconectar
      @estado_de_coneccion = false
      @usuario_actual = nil
    end

end
