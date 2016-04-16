require 'highline/import'
require_relative 'controlador'
require_relative 'modulo_visual'
@visualizar = ModuloVisual.new
@controlador = Controlador.new

loop do
  say '____ Elija una opcion: ____'
  choose do |menu|
    if @controlador.hay_sesion?
      menu.choice(:Cerrar_Sesion) do
        say(">>**#{@controlador.usuario_actual}** Usted se ha deslogueado\n\n")
        @controlador.cerrar_sesion
      end
      menu.choice(:Cambiar_Encriptacion) do
        nick_usuario = @controlador.usuario_actual
        say("\n>>>Para realizar esta accion por favor autentifiquese"\
				" #{nick_usuario}")
        password = ask('>>>Ingrese su contraseña:  ') { |q| q.echo = '*' }
        begin
          @controlador.es_valido?(nick_usuario, password)
          say("\n>>>#{@controlador.usuario_actual} encriptador actual: "\
  				"#{@controlador.codificador_de(nick_usuario)}\n\n")
          @visualizar.menu_de_codificacion(@controlador)
          @controlador.reencriptar(nick_usuario, password)
          codificador_elegido = @controlador.codificador_de(nick_usuario)
          say(">>>#{nick_usuario} su contraseña paso a estar encriptada con ~>"\
					" #{codificador_elegido} <~\n\n")
        rescue
          say("> > >La contraseña no es valida, usted no es #{nick_usuario}.\n\n")
        end
      end
    else
      menu.choice(:Iniciar_Sesion) do
        nick = ask('>>ingrese su usuario:  ')
        if @controlador.existe_nick?(nick)
          password = ask('>>>Ingrese su contraseña:  ') { |q| q.echo = '*' }
          begin
            @controlador.es_valido?(nick, password)
            @controlador.abrir_sesion(nick)
            say(">>>Gracias por iniciar sesion **#{nick}***\n\n")
          rescue
            say("Usuario o contraseña invalid@s por favor vuelva a intentar.\n\n")
          end
        else
          say("El usuario #{nick} no existe vuelva a intentar o registrese.\n")
        end
      end
      menu.choice(:Registrarse) do
        @visualizar.menu_de_codificacion(@controlador)
        say(">>Usted a elegido ~> **#{@controlador.codificador_asignado}** <~"\
            " como metodo de encriptacion.\n\n")
        nick = ask('>>Ingrese su usuario:  ')
        if @controlador.existe_nick?(nick)
          say("\nEl nick que eligio se encuentra en uso, pronto tendremos"\
          ' un ayudante, por favor vuelva a intentar ó elija terminar.')
          loop do
            terminar = false
            choose do |opcion|
              opcion.choice(:Elegir_nick) do
                nick = ask("\nIngrese su usuario:  ")
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
          password = ask('>>Ingrese su contraseña:  ') do |q|
            q.echo = '*'
            q.validate = /^[A-Za-z0-9]+$/
            q.responses[:not_valid] = 'Caracteres especiales no validos'
          end
          pass_confirm = ask('>>Vuelva a ingresar su contraseña:  ') { |q| q.echo = '*' }
          if password == pass_confirm
            @controlador.registrar(nick, password)
            say(">>Gracias pór registrarse!. Ya puede iniciar sesión\n\n")
          else
            say(">>Las contraseñas no coinciden.\n\n")
          end
        end
      end
    end
    menu.choice(:Estado) do
      if @controlador.hay_sesion?
        say(">>>Usted esta logueado como ~> #{@controlador.usuario_actual} <~\n\n")
      else
        say(">>Usted esta \" Deslogueado \" por favor inicie sesion o registrese.\n\n")
      end
    end
    menu.choice(:Salir) do
      @controlador.cerrar_sesion
      say(">>Usted ha salido de la Aplicacion hasta pronto! ;)\n\n")
      exit
    end
  end
end
