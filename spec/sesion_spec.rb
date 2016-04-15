require_relative '../sesion'
# Test del metodo conectar_con , desconectar.
describe Sesion do
  let(:sesion) { Sesion.new }

  it 'Por defecto la sesion esta cerrada, sin usuario'

  it 'Conecta al usuario e inicia sesion'

  it 'Desconecta al usuario y cierra sesion'
end
