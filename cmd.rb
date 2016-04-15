require 'highline/import'
require_relative 'controlador'

@controlador = Controlador.new

loop do
  choose do |menu|
    if @controlador.hay_sesion?
      menu.choice(:Cerrar_Sesion) do
        say("  ~> **#{@controlador.usuario_actual}*** Usted se ha deslogueado")
        @controlador.cerrar_sesion
      end
      menu.choice(:Cambiar_Encriptacion) do
        nick_usuario = @controlador.usuario_actual
        say('Para realizar esta accion por favor autentifiquese'\
				" #{nick_usuario}")
        password = ask('Ingrese su contraseña:  ') { |q| q.echo = '*' }
        if @controlador.validar(nick_usuario, password)
          choose do |codificacion|
            codificacion.choice(:Texto_plano) do
              @controlador.usar_texto_plano
            end
            codificacion.choice(:Caesar_cipher) do
              @controlador.usar_caesar_cipher
            end
            codificacion.choice(:Bcrypt) do
              @controlador.usar_bcrypt
            end
          end
          @controlador.reencriptar(nick_usuario, password)
          codificador_elegido = @controlador.codificador_de(nick_usuario)
          say("#{nick_usuario} su contraseña paso a estar encriptada con ~>"\
					" #{codificador_elegido} <~")
        else
          say("La contraseña no es valida, usted no es #{nick_usuario}")
        end
      end
    else
      menu.choice(:Iniciar_Sesion) do
        nick = ask('ingrese su usuario:  ')
        if @controlador.existe_nick?(nick)
          password = ask('Ingrese su contraseña:  ') { |q| q.echo = '*' }
          if @controlador.validar(nick, password)
            @controlador.abrir_sesion(nick)
            say("Gracias por iniciar sesion **#{nick}***")
          else
            say('Usuario o contraseña invalid@s por favor vuelva a intentar')
          end
        else
          say("El usuario #{nick} no existe :( vuelva a intentar o registrese.")
        end
      end
      menu.choice(:Registrarse) do
        say("\nElija un metodo de encriptacion para registrarse ...")
        choose do |codificacion|
          codificacion.choice(:Texto_plano) do
            @controlador.usar_texto_plano
          end
          codificacion.choice(:Caesar_cipher) do
            @controlador.usar_caesar_cipher
          end
          codificacion.choice(:Bcrypt) do
            @controlador.usar_bcrypt
          end
        end
        say("Usted a elegido ~> ***#{@controlador.codificador_asignado}*** <~"\
    				" como metodo de encriptacion\n\n")
        nick = ask('Ingrese su usuario:  ')
        if @controlador.existe_nick?(nick)
          say('El nick que eligio se encuentra en uso, pronto tendremos'\
					' un ayudante, por favor vuelva a intentar ó elija terminar.')
          loop do
            terminar = false
            choose do |opcion|
              opcion.choice(:Elegir_nick) do
                nick = ask('Ingrese su usuario:  ')
                if @controlador.existe_nick?(nick)
                  say('El nick que eligio se encuentra en uso, pronto tendremos'\
									' un ayudante, por favor vuelva a intentar ó elija terminar.')
                else
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
        unless @controlador.existe_nick?(nick)
          password = ask('Ingrese su contraseña:  ') do |q|
            q.echo = '*'
            q.validate = /^[A-Za-z0-9]+$/
            q.responses[:not_valid] = 'Caracteres especiales no validos'
          end
          pass_confirm = ask('Vuelva a ingresar su contraseña:  ') { |q| q.echo = '*' }
          if password == pass_confirm
            @controlador.registrar(nick, password)
            say('Gracias pòr registrarse!. Ya puede iniciar sesión')
          else
            say('Las contraseñas no coinciden.')
          end
        end
      end
    end
    menu.choice(:Estado) do
      if @controlador.hay_sesion?
        say("Usted esta logueado como ~> #{@controlador.usuario_actual} <~")
      else
        say('Usted esta " Deslogueado " por favor inicie sesion o registrese.')
      end
    end
    menu.choice(:Salir) do
      @controlador.cerrar_sesion
      say('Usted a salido de la Aplicacion hasta pronto! ;)')
      exit
    end
  end
end
