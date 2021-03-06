require_relative 'manager_de_usuario'
require_relative 'sesion'
# Esta clase sera la encargada de derivar los procesos a quien corresponda.
# =>Separa la vista del modelo siguiendo el modelo MVC.
class Controlador
  def initialize
    @manager = ManagerDeUsuario.new
    @sesion = Sesion.new
  end

  def codificador_asignado
    @manager.codificador_asignado.descripcion
  end

  def codificador_de(nick)
    @manager.codificador_de(nick)
  end

  def hay_sesion?
    @sesion.hay_usuario_logueado?
  end

  def usuario_actual
    @sesion.usuario_actual
  end

  def validar_nick(nick)
    @manager.validar_nick(nick)
  end

  def validar_usuario(nick, password)
    @manager.validar_usuario(nick, password)
  end

  def registrar(nick, password)
    @manager.registrar(nick, password)
  end

  def reencriptar(nick, password)
    @manager.reencriptar(nick, password)
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
