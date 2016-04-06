require 'highline/import'

salir = false

while !salir do

choose do |menu|
	menu.prompt = "Desea salir?"
	menu.choice(:si) {
		salir = true
		say("Gracias por venir")
	}
	menu.choice(:No) do
		say("Ok, nos quedamos")
	end
end
end
