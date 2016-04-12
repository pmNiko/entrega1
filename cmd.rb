require 'highline/import'
require_relative 'controlador'

@controlador = Controlador.new

loop do
	salir = false
			choose do |menu|
						if @controlador.hay_sesion?
								menu.choice(:Logout) do
										say("#{@controlador.usuario_actual} Usted se ha deslogueado")
										@controlador.cerrar_sesion
								end
								menu.choice(:Cambiar_Encriptacion) do
											say("#{@controlador.usuario_actual} para realizar esta accion por
														favor autentifiquese")
											pass = ask("Ingrese su contraseña:  ") { |q| q.echo = "*" }
											if @controlador.validar(@controlador.usuario_actual, pass)
																choose do |codificacion|
																			codificacion.choice(:Texto_plano) do
																					codificador = "Texto Plano"
																					@controlador.usar_texto_plano
																			end
																			codificacion.choice(:Caesar_cipher) do
																					codificador = "Caesar Cipher"
																					@controlador.usar_caesar_cipher
																			end
																			codificacion.choice(:Bcrypt) do
																					codificador = "Bcrypt"
																					@controlador.usar_bcrypt
																			end
																end
																@controlador.reencriptar(@controlador.usuario_actual, pass)
																say("#{@controlador.usuario_actual}
																 su contraseña paso a estar encriptada con #{codificador} ")
											else
																say("La contraseña no es valida, usted no es #{@controlador.usuario_actual}")
											end

								end
						else
								menu.choice(:Loguin) do
										nick = ask("ingrese su usuario:  ")
										if @controlador.existe_nick(nick)
													pass = ask("Ingrese su contraseña:  ") { |q| q.echo = "*" }
													if @controlador.validar(nick, pass)
																@controlador.abrir_sesion(nick)
																say("Gracias iniciar sesion #{@controlador.usuario_actual}")
													else
																say("Usuario o contraseña invalid@s por favor vuelva a intentar")
													end
										else
													say("El usuario #{nick} no existe :( vuelva a intentar.")
										end

								end
								menu.choice(:Registrarse) do
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
									loop do
												terminar = false
												choose do |opcion|
															opcion.choice(:Elegir_nick)do
																		nick = ask("ingrese su usuario:  ")
																		if @controlador.existe_nick(nick)
																			  say("El nick que eligio se encuentra en uso, pronto tendremos un ayudante, por favor vuelva a intentar.")
																		else
																				pass = ask("Ingrese su contraseña:  ")  { |q| q.echo = "*" }
																				pass_confirm = ask("Vuelva a ingresar su contraseña:  ") { |q| q.echo = "*" }
																				if pass == pass_confirm
																						@controlador.registrar(nick, pass)
																						say("Gracias pòr registrarse!. Ya puede loguearse")
																				else
																						say("Las contraseñas no coinciden.")
																				end
																		end
															end
															opcion.choice(:terminar)do
																terminar = true
															end
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
