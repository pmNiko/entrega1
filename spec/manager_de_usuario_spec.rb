require_relative '../manager_de_usuario'
# Test de los metodos:
# =>validar(nick, password), reencriptar(nick, password), codificador_de(nick)
# =>registrar(nick, password), existe_nick?(nick), buscar(nick).
describe ManagerDeUsuario do
  let(:manager) { ManagerDeUsuario.new }

  it 'Por defecto el manager se instancia sin usuarios'

  it 'Validacion de un usuario: nick y password'

  it 'ver metodo de encriptacion de un usuario'

  it 'Cambiar metodo de encriptacion de password'

  it 'Registrar un nuevo usuario'

  it 'Validacion de un nick'

  it 'Buscar un determinado usuario por su nick'
end
