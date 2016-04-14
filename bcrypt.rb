require 'bcrypt'
include BCrypt

class Bcrypt
  def descripcion
    'BCrypt'
  end

  def encriptar(password)
    Password.create(password, cost: 10)
  end

  def validar(password, password_encriptada)
    Password.new(password_encriptada) == password
  end
end
