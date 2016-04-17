require_relative '../manager_de_usuario'
require_relative '../excepcion'
# Test de los metodos:
# =>validar(nick, password), reencriptar(nick, password), codificador_de(nick)
# =>registrar(nick, password), existe_nick?(nick), buscar(nick).
describe ManagerDeUsuario do
  let(:manager) { ManagerDeUsuario.new }

  it 'Por defecto se instancia con un usuario para pruebas'do
    expect{manager.validar_usuario('Andres', 'Pass36')}.not_to raise_error

    expect{manager.validar_usuario('Andres', 'Pass99')
    }.to raise_error(PasswordInvalido, "Password invalido")
  end

  it 'Codificador de un usuario'do
    expect(manager.codificador_de('Andres')).to eq('BCrypt')
  end

  it 'Cambiar metodo de encriptacion de password'do
    expect(manager.codificador_de('Andres')).to eq('BCrypt')

    manager.usar_caesar_cipher
    manager.reencriptar('Andres', 'Pass36')
    expect(manager.codificador_de('Andres')).to eq('Caesar Cipher')

    manager.usar_texto_plano
    manager.reencriptar('Andres', 'Pass36')
    expect(manager.codificador_de('Andres')).to eq('Texto Plano')
  end

  it 'Registrar un nuevo usuario'do
    expect{manager.buscar('Martin')
    }.to raise_error(UsuarioNoExiste, "El usuario no existe")

    manager.registrar('Martin', 'Password89')

    expect{manager.buscar('Martin')}.not_to raise_error
  end

  it 'Validacion de un nick'do
    expect{manager.validar_nick('Martin')
    }.to raise_error(NickNoRegistrado, "El nick no se encuentra registrado")

    manager.registrar('Martin', 'Password89')

    expect{manager.validar_nick('Martin')}.not_to raise_error
  end

  it 'Validacion de un usuario'do
    expect{manager.validar_usuario('Andres', 'Pass99')
    }.to raise_error(PasswordInvalido, "Password invalido")

    expect{manager.validar_usuario('Andres', 'Pass36')}.not_to raise_error
  end

  it 'Busqueda de un usuario'do
    expect{manager.buscar('Martin')
    }.to raise_error(UsuarioNoExiste, "El usuario no existe")

    expect{manager.buscar('Andres')}.not_to raise_error
  end
end
