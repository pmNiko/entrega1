class UsuarioNoExiste < StandardError
  def initialize
    super('El usuario no existe')
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
