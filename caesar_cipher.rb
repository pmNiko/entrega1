# Definicion de la clase CaesarCipher.
# =>Este es uno de los metodos de encriptacion.
# =>Vulnerabilidad:  "Alta" (No utilizar)
# =>Desencriptado:   -> Por fuerza bruta o analisis de frecuencia de letras.
class CaesarCipher
  def descripcion
    'Caesar Cipher'
  end

  def initialize
    alfabeto = ('a'..'z').to_a.join + ('A'..'Z').to_a.join
    numeros = ('0'..'9').to_a.join
    @alfanumerico = alfabeto + numeros
    @cipher = @alfanumerico.chars.rotate(3).join
  end

  def encriptar(password)
    password.tr(@alfanumerico, @cipher)
  end

  def desencriptar(password)
    password.tr(@cipher, @alfanumerico)
  end

  def es_valido?(password, password_encriptada)
    password.eql? desencriptar(password_encriptada)
  end
end
