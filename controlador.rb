require_relative 'manager_de_usuario'
require_relative 'sesion'

class Controlador
    def initialize
      @manager = ManagerDeUsuario.new
      @sesion = Sesion.new
    end

    def nick_disponible?
      !@manager.existe_nick?
    end

    def registrar

    end

    def validar(nick, pass)
      @manager.validar(nick, pass)
    end

    def hay_sesion?
      @sesion.estado_de_coneccion
    end

    def abrir_sesion
      @sesion.conectar
    end

    def cerrar_sesion
      @sesion.desconectar
    end

    def usar_texto_plano
      @manager.usar_texto_plano
    end

    def usar_caesar_cypher
      @manager.usar_caesar_cypher
    end

    def usar_bcrypt
      @manager.usar_bcrypt
    end

end
