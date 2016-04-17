require_relative '../texto_plano'
# Prueba el funcionamiento de los metodos encriptar y validar.
describe TextoPlano do
  let(:codificador) { TextoPlano.new }
  let(:clave_codificada) { TextoPlano.new.encriptar 'Clave09' }

  it 'Encriptacion de una clave alfanumerica' do
    expect(codificador.encriptar('Clave09')).to eq 'Clave09'
  end

  it 'Validacion de una clave alfanumerica' do
    expect(codificador.es_valido?('Clave09', clave_codificada)).to be true
    expect(codificador.es_valido?('Clave10', clave_codificada)).not_to be true
  end

  it 'Descripcion' do
    expect(codificador.descripcion).to eq 'Texto Plano'
  end
end
