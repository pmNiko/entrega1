require_relative '../sesion'
require_relative '../usuario'
require_relative '../bcrypt'
# Test del metodo conectar_con , desconectar.
describe Sesion do
  let(:sesion) { Sesion.new }
  let(:usuario) { Usuario.new('Martin', 'pass', Bcrypt.new) }

  it 'Por defecto la sesion esta cerrada'do
    expect(sesion.hay_usuario_logueado?).not_to be true
  end

  it 'Conectar con un usuario'do
    sesion.conectar_con(usuario.nick)
    expect(sesion.hay_usuario_logueado?).to be true

  end

  it 'Desconectar un usuario'do
    sesion.conectar_con(usuario.nick)
    expect(sesion.hay_usuario_logueado?).to be true

    sesion.desconectar
    expect(sesion.hay_usuario_logueado?).not_to be true
  end

  it 'Hay usuario logueado'do
    expect(sesion.hay_usuario_logueado?).to be false

    sesion.conectar_con(usuario.nick)

    expect(sesion.hay_usuario_logueado?).to be true
  end

end
