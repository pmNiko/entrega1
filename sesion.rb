class Sesion
    attr_reader:usuario_actual
    def initialize
      desconectar
    end

    def conectar_con(nick)
      @usuario_actual = nick
    end

    def desconectar
      @usuario_actual = nil
    end

    def hay_usuario_logueado?
      @usuario_actual.nil?
    end

end
