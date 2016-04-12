require 'highline/import'
require_relative 'controlador'

@controlador = Controlador.new

loop do
	salir = false
			choose do |menu|
						if @controlador.hay_sesion?
								menu.choice(:Logout) do
										@controlador.cerrar_sesion
										say("Usted se ha deslogueado")
								end
								menu.choice(:Cambiar_Encriptacion) do
											choose do |codificacion|
														codificacion.choice(:Texto_plano) do
															@controlador.usar_texto_plano
														end
														codificacion.choice(:Caesar_cypher) do
															@controlador.usar_caesar_cypher
														end
														codificacion.choice(:Bcrypt) do
															@controlador.usar_bcrypt
														end
											end
								end
						else
								menu.choice(:Loguin) do
										nick = ask("ingrese su usuario:  ")
										pass = ask("Ingrese su contraseña:  ") { |q| q.echo = "*" }
												if @controlador.validar(nick, pass)
													 		@controlador.abrir_sesion
															say("Gracias iniciar sesion #{nick}")
												else
															say("Usuario o contraseña invalid@s por favor vuelva a intentar")
												end
								end
								menu.choice(:Registrarse) do
											choose do |codificacion|
														codificacion.choice(:Texto_plano) do
															@controlador.usar_texto_plano
														end
														codificacion.choice(:Caesar_cypher) do
															@controlador.usar_caesar_cypher
														end
														codificacion.choice(:Bcrypt) do
															@controlador.usar_bcrypt
														end
											end
									loop do
										terminar = false
												choose do |opcion|
													opcion.choice(:Elegir_nick)do
															nick = ask("ingrese su usuario:  ")
															if @controlador.nick_disponible?
																	pass = ask("Ingrese su contraseña:  ")  { |q| q.echo = "*" }
																	pass_confirm = ask("Vuelva a ingresar su contraseña:  ") { |q| q.echo = "*" }
																	if pass == pass_confirm
																			say("Gracias pòr registrarse!. Ya puede loguearse")
																	else
																			say("Las contraseñas no coinciden.")
																	end
															else
																  say("El nick que eligio se encuentra en uso, pronto tendremos un ayudante, por favor vuelva a intentar.")
															end
													end

													opcion.choice(:terminar)do
														terminar = true
													end

										break if terminar
								  end
								end
						end
						menu.choice(:Estado) do
								if @controlador.hay_sesion?
				        		say('Usted esta " Logueado "')
								end
								say('Usted esta " Deslogueado " por favor inicie sesion o registrese.')
						end
						menu.choice(:Salir) do
								@controlador.cerrar_sesion
		            say("Usted a salido de la Aplicacion hasta pronto! ;)")
								salir = true
						end
			end

   break if salir
 end
 end
