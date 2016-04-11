require 'bcrypt'
include BCrypt

class Bcrypt
	def encriptar(password)
		 Password.create(password, cost: 10)
	end

	def validar(clave, clave_encriptada)
		 Password.new(clave_encriptada) == clave
	end
end
