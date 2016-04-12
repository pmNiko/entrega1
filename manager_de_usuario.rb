require_relative 'usuario'
require_relative 'texto_plano'
require_relative 'caesar_cipher'
require_relative 'bcrypt'

class ManagerDeUsuario
    def initialize
        @usuarios = []
        @codificador_asignado = nil
    end

    def validar(nick, pass)
      usuario = self.buscar(nick)
      codificador = usuario.codificador
      codificador.validar(pass, usuario.password)
    end

    def registrar(usuario)
        @usuarios << usuario
    end

    def existe_nick?(nick)
        @usuario.any? { |usuario| usuario.nick == nick}
    end

    def buscar(nick)
        @usuarios.detect {|usuario| usuario.nick == nick}
    end

    def usar_texto_plano
      @codificador_asignado = Texto_plano.new
    end

    def usar_caesar_cypher
      @codificador_asignado = Caesar_cypher.new
    end

    def usar_bcrypt
      @codificador_asignado = Bcrypt.new
    end
end
