require_relative '../sesion'
require_relative '../usuario'
require_relative '../bcrypt'
# Test del metodo conectar_con , desconectar.
describe Sesion do
  let(:sesion) { Sesion.new }
  let(:usuario) { Usuario.new('Martin', 'pass', Bcrypt.new) }

  it 'Por defecto la sesion esta cerrada, sin usuario'do
    expect(sesion.hay_usuario_logueado?).to be false
    expect(sesion.usuario_actual).to be_nil
  end

  it 'Conecta al usuario e inicia sesion'do
    sesion.conectar_con(usuario.nick)

    expect(sesion.hay_usuario_logueado?).to be true
    expect(sesion.usuario_actual).equal? usuario
  end

  it 'Desconecta al usuario y cirrar sesion'do
    sesion.conectar_con(usuario.nick)
    expect(sesion.usuario_actual).equal? usuario
    
    sesion.desconectar

    expect(sesion.hay_usuario_logueado?).to be false
    expect(sesion.usuario_actual).to be_nil
  end

end
