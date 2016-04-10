require_relative '../texto_plano'

describe TextoPlano do
			encriptador = TextoPlano.new
	it "Encriptacion de una clave" do
      expect(encriptador.encriptar 'miclavesegura').to eq 'miclavesegura'
  end

  it "Desencriptacion de una clave" do
      clave = encriptador.encriptar 'miclavesegura'
      expect(encriptador.desencriptar clave).to eq 'miclavesegura'
  end

end
