require_relative '../texto_plano'

describe TextoPlano do
			codificador = TextoPlano.new
	it "Encriptacion de una clave" do
      expect(codificador.encriptar 'miclavesegura').to eq 'miclavesegura'
  end

  it "Validar una clave" do
      clave = codificador.encriptar 'miclavesegura'
      expect(codificador.validar 'miclavesegura',clave ).to eq true
  end

end
