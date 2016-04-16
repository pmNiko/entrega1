class UsuarioNoExiste < StandardError
  def initialize(nick_de_usuario)
    @nick_de_usuario = nick_de_usuario
    mensaje = 'El usuario "'+ @nick_de_usuario +'" no existe'
    super(mensaje)
  end
end

class PasswordInvalido < StandardError
  def initialize
    super('Password invalido')
  end
end

class NickNoRegistrado < StandardError
  def initialize
    super('El nick no se encuentra registrado')
  end
end
