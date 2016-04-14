class TextoPlano
  def descripcion
    'Texto Plano'
  end

  def encriptar(password)
    password
  end

  def validar(password, password_encriptada)
    password == password_encriptada
  end
end
