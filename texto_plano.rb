# Definicion de la clase TextoPlano.
# =>Este es uno de los metodos de encriptacion.
# =>Vulnerabilidad :  "Asegurada" (No utilizar)
# =>Desencriptado:   -> Mediante cualquier editor de texto.
class TextoPlano
  def descripcion
    'Texto Plano'
  end

  def encriptar(password)
    password
  end

  def es_valido?(password, password_encriptada)
    password.eql? password_encriptada
  end
end
