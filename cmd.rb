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
          @controlador.validar_usuario(nick_usuario, password)
          say("\n>>>Encriptador actual: #{@controlador.codificador_de(nick_usuario)}\n\n")
          @visualizar.menu_de_codificacion(@controlador)
          @controlador.reencriptar(nick_usuario, password)
        rescue PasswordInvalido
          say("> > >La contraseña no es valida, usted no es #{nick_usuario}.\n\n")
        end
      end

    else

      menu.choice(:Iniciar_Sesion) do
        nick = ask('>>ingrese su usuario:  ')
        begin
          @controlador.validar_nick(nick)
          password = ask('>>>Ingrese su contraseña:  ') { |q| q.echo = '*' }
          begin
            @controlador.validar_usuario(nick, password)
            @controlador.abrir_sesion(nick)
            say(">>>Gracias por iniciar sesion **#{nick}***\n\n")
          rescue PasswordInvalido
            say("Usuario o contraseña invalid@s por favor vuelva a intentar.\n\n")
          end
        rescue NickNoRegistrado
          say("El usuario #{nick} no existe vuelva a intentar o registrese.\n")
        end
      end

      menu.choice(:Registrarse) do
        @visualizar.menu_de_codificacion(@controlador)
        nick = ask('>>Ingrese su usuario:  ')
        begin
          @controlador.validar_nick(nick)
          say("\nEl nick que eligio se encuentra en uso, pronto tendremos"\
          ' un ayudante, por favor vuelva a intentar ó elija terminar.')
          nick = @visualizar.menu_buscar_nick(@controlador)
          @visualizar.menu_de_registro(@controlador, nick)
        rescue NickNoRegistrado
          @visualizar.menu_de_registro(@controlador, nick)
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
