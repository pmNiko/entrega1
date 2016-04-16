require_relative 'usuario'
require_relative 'texto_plano'
require_relative 'caesar_cipher'
require_relative 'bcrypt'
require_relative 'excepcion.rb'
# Manejador los usuarios y el comportamiendo relacionado a ellos
# => Agregado, modificacion y busqueda.
class ManagerDeUsuario
  attr_reader :usuarios, :codificador_asignado
  def initialize
    pass = Bcrypt.new.encriptar('pass')
    martin = Usuario.new('martin', pass, Bcrypt.new)
    @usuarios = [martin]
  end

  def validar_usuario(nick, password)
    usuario = buscar(nick)
    codificador = usuario.codificador
    raise PasswordInvalido.new unless codificador.es_valido?(password, usuario.password)
  end

  def validar_nick(nick)
    raise NickNoRegistrado.new unless @usuarios.any? { |usuario| usuario.nick.eql? nick }
  end

  # Este se usara cuando el usuario decida cambiar el metodo de cifrado.
  def reencriptar(nick, password)
    usuario = buscar(nick)
    #Reasigna Codificador
    usuario.codificador = @codificador_asignado
    usuario.password = @codificador_asignado.encriptar(password)
  end

  def registrar(nick, password)
    password = @codificador_asignado.encriptar(password)
    @usuarios << Usuario.new(nick, password, @codificador_asignado)
  end


  def buscar(nick)
    @usuarios.detect(-> { UsuarioNoExiste.new(nick) }) { |usuario| usuario.nick.eql? nick }
  end

  def codificador_de(nick)
    usuario = buscar(nick)
    usuario.codificador.descripcion
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
