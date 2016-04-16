class ModuloVisual
  def menu_de_codificacion(un_controlador)
    say("\nElija un metodo de encriptacion para registrarse ...")
    choose do |codificacion|
      codificacion.choice(:Texto_plano) do
        un_controlador.usar_texto_plano
      end
      codificacion.choice(:Caesar_cipher) do
        un_controlador.usar_caesar_cipher
      end
      codificacion.choice(:Bcrypt) do
        un_controlador.usar_bcrypt
      end
    end
  end
end
