require "rubygems"
require 'highline/import'
require_relative 'usuario'

=begin
cli = HighLine.new
answer = cli.ask "What do you think?"
puts "You have answered: #{answer}"


# Default answer

cli.ask("Company?  ") { |q| q.default = "none" }



# Type conversion for answers:

cli.ask("Birthday?  ", Date)
cli.ask("Interests?  (comma sep list)  ", lambda { |str| str.split(/,\s*/) })


# Reading passwords:

cli.ask("Enter your password:  ") { |q| q.echo = false }
cli.ask("Enter your password:  ") { |q| q.echo = "x" }


# ERb based output (with HighLine's ANSI color tools):

cli.say("This should be <%= color('bold', BOLD) %>!")


# Menus:

cli.choose do |menu|
  menu.prompt = "Please choose your favorite programming language?  "
  menu.choice(:ruby) { cli.say("Good choice!") }
  menu.choices(:python, :perl) { cli.say("Not from around here, are you?") }
end
=end

















salir = false
usuario = Usuario.new('martin', 'pass')

	while !salir do

			choose do |menu|
						if !usuario.esta_logueado?
								menu.choice(:Loguin) {
									nick = ask("ingrese su usuario:  ")
									pass = ask("Ingrese su contraseña:  ") { |q| q.echo = "*" }
									if (usuario.nick == nick) & (usuario.password == pass)
										usuario.loguear
										say("Gracias iniciar sesion #{usuario.nick}")
									else
											say("Usuario o contraseña invalid@s por favor vuelva a intentar")
									end
								}
								menu.choice(:Registrarse) do
									nick = ask("ingrese su usuario:  ")
									pass = ask("Ingrese su contraseña:  ")  { |q| q.echo = "*" }
									pass_confirm = ask("Vuelva a ingresar su contraseña:  ") { |q| q.echo = "*" }
									if pass == pass_confirm
											say("Gracias pòr registrarse!. Ya puede loguearse")
									end
								end
						else
								menu.choice(:Logout) do
									usuario.desloguear
									say("Usted se ha deslogueado")
								end
								menu.choice(:Cambiar_Password) do
									pass = ask("Contraseña actual:  ")  { |q| q.echo = "*" }
									pass = ask("Nueva contraseña:  ")  { |q| q.echo = "*" }
									pass_confirm = ask("Confirme su contraseña:  ") { |q| q.echo = "*" }
									say("Contraseña actualizada")
								end
						end
						menu.choice(:Estado) do
				            say("Usted esta: #{usuario.estado}")
						end
						menu.choice(:Salir) do
										usuario.desloguear
				            say("Usted a salido de la Aplicacion hasta pronto! ;)")
							salir = true
						end
			end
	end

=begin
# The old way, using ask() and say()...
choices = %w{ruby python perl}
say("Esta es la antigua forma de usar ask() and say()...")
say("Ingrese su lenguaje de programacion favorito:")
say(choices.map { |c| "  #{c}\n" }.join)

case ask("?  ", choices)
when "ruby"
  say("Buena eleccion!")
else
  say("No es de por aquí, ¿verdad ?")
end

# The new and improved choose()...
say("\nEsta es la nueva forma (default)...")
choose do |menu|
  menu.prompt = "Ingrese su lenguaje de programacion favorito:  "

  menu.choice :ruby do say("Buena eleccion!") end
  menu.choices(:python, :perl) do say("No es de por aquí, ¿verdad ?") end
end

say("\nEste es el menu de indexacion...")
choose do |menu|
  menu.index        = :letter
  menu.index_suffix = ") "

  menu.prompt = "Ingrese su lenguaje de programacion favorito: "

  menu.choice :ruby do say("Buena eleccion!") end
  menu.choices(:python, :perl) do say("No es de por aquí, ¿verdad ?") end
end

say("\nEste es un diseño diferente...")
choose do |menu|
  menu.layout = :one_line

  menu.header = "Languages"
  menu.prompt = "Favorite?  "

  menu.choice :ruby do say("Good choice!") end
  menu.choices(:python, :perl) do say("Usted no es de por aqui verdad?") end
end

say("\nYou can even build shells...")
loop do
  choose do |menu|
    menu.layout = :menu_only

    menu.shell  = true

    menu.choice(:load, "Cargando archivo.") do |command, details|
      say("Cargando archivo de opciones:  #{details}...")
    end
    menu.choice(:save, "Guardando archivo.") do |command, details|
      say("Guardadndo opciones de archivo:  #{details}...")
    end
    menu.choice(:quit, "Saliendo del programa.") { exit }
  end
end
=end
