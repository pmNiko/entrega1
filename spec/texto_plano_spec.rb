require_relative '../texto_plano'
# Prueba el funcionamiento de los metodos encriptar y validar.
describe TextoPlano do
  let(:codificador) { TextoPlano.new }

  it 'Encriptacion de una clave alfanumerica' do
    expect(codificador.encriptar('miclavesegura')).to eq 'miclavesegura'
  end

  it 'Validacion de una clave alfanumerica' do
    clave = codificador.encriptar 'miclavesegura'
    expect(codificador.validar('miclavesegura', clave)).to be true
    expect(codificador.validar('otraClave09', clave)).to be false
  end
end
