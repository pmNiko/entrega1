require_relative 'usuario'
require_relative 'texto_plano'
require_relative 'caesar_cipher'
require_relative 'bcrypt'
# Manejador los usuarios y el comportamiendo relacionado a ellos
# => Agregado, modificacion y busqueda.
class ManagerDeUsuario
  attr_reader :usuarios, :codificador_asignado
  def initialize
    pass = Bcrypt.new.encriptar('pass')
    martin = Usuario.new('martin', pass, Bcrypt.new)
    @usuarios = [martin]
  end

  def es_valido?(nick, password)
    usuario = buscar(nick)
    codificador = usuario.codificador
    raise ArgumentError unless codificador.es_valido?(password, usuario.password)
  end

  # Este se usara cuando el usuario decida cambiar el metodo de cifrado.
  def reencriptar(nick, password)
    usuario = buscar(nick)
    usuario.codificador = @codificador_asignado
    raise 'No valida' unless usuario.password = @codificador_asignado.encriptar(password)
  end

  def registrar(nick, password)
    password = @codificador_asignado.encriptar(password)
    @usuarios << Usuario.new(nick, password, @codificador_asignado)
  end

  def existe_nick?(nick)
    @usuarios.any? { |usuario| usuario.nick.eql? nick }
  end

  def buscar(nick)
    @usuarios.detect(-> { raise ArgumentError, 'El usuario no existe' }) { |usuario| usuario.nick.eql? nick }
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
