require_relative 'manager_de_usuario'
require_relative 'sesion'

class Controlador
    def initialize
      @manager = ManagerDeUsuario.new
      @sesion = Sesion.new
    end

    def reencriptar(nick, pass)
      @manager.reencriptar(nick, pass)
    end

    def usuario_actual
      @sesion.usuario_actual
    end

    def existe_nick(nick)
      @manager.existe_nick(nick)
    end

    def registrar(nick, pass)
      @manager.registrar(nick, pass)
    end

    def validar(nick, pass)
      @manager.validar(nick, pass)
    end

    def hay_sesion?
      @sesion.estado_de_coneccion
    end

    def abrir_sesion(nick)
      @sesion.conectar_con(nick)
    end

    def cerrar_sesion
      @sesion.desconectar
    end

    def usar_texto_plano
      @manager.usar_texto_plano
    end

    def usar_caesar_cipher
      @manager.usar_caesar_cipher
    end

    def usar_bcrypt
      @manager.usar_bcrypt
    end

end
