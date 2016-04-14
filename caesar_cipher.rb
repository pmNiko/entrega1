class CaesarCipher
  def descripcion
    "en Caesar Cipher"
  end

  def initialize
    @alfanumerico = ('a'..'z').to_a.join + ('A'..'Z').to_a.join + ('0'..'9').to_a.join
    @cipher = @alfanumerico.chars.rotate(3).join
  end

  def encriptar(password)
    password.tr(@alfanumerico, @cipher)
  end

  def desencriptar(password)
    password.tr(@cipher, @alfanumerico)
  end

  def validar(password, password_encriptada)
    password == desencriptar(password_encriptada)
  end
end
