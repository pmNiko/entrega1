require_relative '../bcrypt'
# Test del metodo validar.
describe Bcrypt do
  let(:codificador) { Bcrypt.new }
  let(:clave_codificada) { Bcrypt.new.encriptar 'Clave09' }

  it 'Encriptacion de una clave alfanumerica' do
    expect(codificador.encriptar('Clave09')).to eq 'Clave09'
    expect(codificador.encriptar('Clave09')).not_to eq 'Clave10'
  end

  it 'Validacion de una clave alfanumerica' do
    expect(codificador.es_valido?('Clave09', clave_codificada)).to be true
    expect(codificador.es_valido?('Clave10', clave_codificada)).not_to be true
  end

  it 'Descripcion' do
    expect(codificador.descripcion).to eq 'BCrypt'
  end
end
