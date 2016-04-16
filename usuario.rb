# Definicion de la clase Usuario.
class Usuario
  attr_accessor :password, :codificador
  attr_reader :nick
  def initialize(nick, password, codificador)
    @nick = nick
    @password = password
    @codificador = codificador
  end
end
