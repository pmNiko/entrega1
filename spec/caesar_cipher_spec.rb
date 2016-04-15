require_relative '../caesar_cipher'
# Prueba el funcionamiento de los metodos encriptar y validar.
describe CaesarCipher do
  let(:codificador) { CaesarCipher.new }

  it 'Encriptacion de una clave alfanumerica' do
    expect(codificador.encriptar('MiClave09')).to eq 'PlFodyh3c'
  end

  it 'Validacion de una clave alfanumerica' do
    clave = codificador.encriptar 'MiClave09'
    expect(codificador.validar('MiClave09', clave)).to be true
    expect(codificador.validar('otraClave09', clave)).to be false
  end
end
