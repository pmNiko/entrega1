# Clase definida para factorizar el codigo de la vista.
class ModuloVisual
  # Permite elegir al usuario entre los distintos encriptadores
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

    say(">>Usted a elegido ~> **#{un_controlador.codificador_asignado}** <~"\
        " como metodo de encriptacion.\n\n")
  end

  def menu_de_registro(un_controlador, un_nick)
    say("\n>>La contraseña debe ser alfanumerica.")
    password = ask('>>Ingrese su contraseña:  ') do |q|
      q.echo = '*'
      q.validate = /^[A-Za-z0-9]+$/
      q.responses[:not_valid] = 'Caracteres especiales no validos'
    end
    pass_confirm = ask('>>Vuelva a ingresar su contraseña:  ') { |q| q.echo = '*' }
    if password == pass_confirm
      un_controlador.registrar(un_nick, password)
      say(">>Gracias pór registrarse!. Ya puede iniciar sesión\n\n")
    else
      say(">>Las contraseñas no coinciden.\n\n")
    end
  end

  # Sirve para la busqueda de un nick disponible
  def menu_buscar_nick(un_controlador, un_nick)
    say("\nEl nick que eligio se encuentra en uso, pronto tendremos"\
    ' un ayudante, por favor vuelva a intentar ó elija terminar.')
    terminar = false
    loop do
      choose do |opcion|
        opcion.choice(:Elegir_nick) do
          un_nick = ask("\nIngrese su usuario:  ")
          begin
            un_controlador.validar_nick(un_nick)
            say('El nick que eligio se encuentra en uso, pronto tendremos'\
            ' un ayudante, por favor vuelva a intentar ó elija terminar.')
          rescue NickNoRegistrado
            menu_de_registro(un_controlador, un_nick)
            terminar = true
          end
        end

        opcion.choice(:terminar) do
          terminar = true
        end
      end
      break if terminar
    end
  end
end
