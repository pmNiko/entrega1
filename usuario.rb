class Usuario
  attr_accessor :nick, :password, :codificador

  def initialize(nick, password, codificador)
    @nick = nick
    @password = password
    @codificador = codificador
  end
end
