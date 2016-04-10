require_relative '../caesar_cipher'

describe CaesarCipher do
      encriptador = CaesarCipher.new
	it "Encriptacion de una clave alfanumerica" do
      expect(encriptador.encriptar 'MiClave09').to eq 'PlFodyh3c'
  end

  it "Desencriptacion de una clave alfanumerica" do
      clave = encriptador.encriptar 'MiClave09'
      expect(encriptador.desencriptar clave).to eq 'MiClave09'
  end

end
