require_relative '../caesar_cipher'

describe CaesarCipher do
      codificador = CaesarCipher.new
	it "Encriptacion de una clave alfanumerica" do
      expect(codificador.encriptar 'MiClave09').to eq 'PlFodyh3c'
  end

  it "Validar una clave alfanumerica" do
      clave = codificador.encriptar 'MiClave09'
      expect(codificador.validar 'MiClave09',clave ).to eq true
  end

end
