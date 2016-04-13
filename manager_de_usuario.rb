require_relative 'usuario'
require_relative 'texto_plano'
require_relative 'caesar_cipher'
require_relative 'bcrypt'

class ManagerDeUsuario
  attr_reader :usuarios

    def initialize
        @usuarios = []
        @codificador_asignado = TextoPlano.new
    end

    def validar(nick, pass)
      usuario = self.buscar(nick)
      codificador = usuario.codificador
      codificador.validar(pass, usuario.password)
    end

    def reencriptar(nick, pass)
      usuario = self.buscar(nick)
      usuario.codificador=@codificador_asignado
      password = @codificador_asignado.encriptar(pass)
      usuario.cambiar_pass(password)
    end

    def registrar(nick, pass)
        password = @codificador_asignado.encriptar(pass)
        @usuarios << Usuario.new(nick, password, @codificador_asignado)
    end

    def existe_nick(nick)
        @usuarios.any?{ |usuario| usuario.nick.eql? nick}
    end

    def buscar(nick)
        @usuarios.detect{|usuario| usuario.nick.eql? nick}
    end

    def usar_texto_plano
      @codificador_asignado = TextoPlano.new
    end

    def usar_caesar_cipher
      @codificador_asignado = CaesarCipher.new
    end

    def usar_bcrypt
      @codificador_asignado = Bcrypt.new
    end
end
