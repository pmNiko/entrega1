require_relative '../bcrypt'
# Test del metodo validar.
describe Bcrypt do
  let(:codificador) { Bcrypt.new }

  it 'Validacion de una clave alfanumerica' do
    clave_encriptada = codificador.encriptar 'miClaveSegura09'

    expect(codificador.validar('miClaveSegura09', clave_encriptada)).to be true
    expect(codificador.validar('otraClave09', clave_encriptada)).to be false
  end
end
