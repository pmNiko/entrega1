require 'bcrypt'
include BCrypt
# Definicion de la clase Bcrypt.
# =>Este es uno de los metodos de encriptacion.
# =>Vulnerabilidad:  "Baja" (Recomendado)
# =>Desencriptado:   -> No es reversible.
class Bcrypt
  def descripcion
    'BCrypt'
  end

  def encriptar(password)
    Password.create(password, cost: 10)
  end

  def es_valido?(password, password_encriptada)
    password_encriptada == password
  end
end
