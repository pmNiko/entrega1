class Usuario
  attr_reader  :nick, :password, :codificador
  attr_writer :codificador

  def initialize(nick, password, codificador)
    @nick = nick
    @password = password
    @codificador = codificador
  end

  def cambiar_pass(nuevo_pass)
    @password = nuevo_pass
  end
end
