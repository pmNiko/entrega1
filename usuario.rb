class Usuario
  attr_reader :nick, :password, :estado

  def initialize(nick, password)
    @nick = nick
    @password = password
    @estado = 'deslogueado'
  end

  def esta_logueado?
    @estado == 'logueado'
  end

  def loguear
    @estado = 'logueado'
  end

  def desloguear
    @estado = 'deslogueado'
  end

  def cambiar_pass(nuevo_pass)
    @password = nuevo_pass
  end
end
