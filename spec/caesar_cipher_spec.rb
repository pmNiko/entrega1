require_relative '../caesar_cipher'
# Prueba el funcionamiento de los metodos encriptar y validar.
describe CaesarCipher do
  let(:codificador) { CaesarCipher.new }
  let(:clave_codificada) { CaesarCipher.new.encriptar 'Clave09' }

  it 'Encriptacion de una clave alfanumerica' do
    expect(codificador.encriptar('Clave09')).to eq 'Fodyh3c'
  end

  it 'Validacion de una clave alfanumerica' do
    expect(codificador.es_valido?('Clave09', clave_codificada)).to be true
    expect(codificador.es_valido?('Clave10', clave_codificada)).not_to be true
  end

  it 'Descripcion' do
    expect(codificador.descripcion).to eq 'Caesar Cipher'
  end
end
