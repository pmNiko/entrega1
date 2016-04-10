class CaesarCipher
  def initialize
    @alfanumerico = ('a'..'z').to_a.join + ('A'..'Z').to_a.join + ('0'..'9').to_a.join
    @cipher = @alfanumerico.chars.rotate(3).join
  end

  def encriptar(clave)
    clave.tr(@alfanumerico, @cipher)
  end

  def desencriptar(clave)
    clave.tr(@cipher, @alfanumerico)
  end
end
