require_relative '../texto_plano'

describe TextoPlano do

	it "Encriptacion de una clave" do
      expect(TextoPlano.new.encriptar 'miclavesegura').to eq 'miclavesegura'
  end

  it "Desencriptacion de una clave" do
      clave_encriptada = 'miclavesegura'
      expect(TextoPlano.new.encriptar clave_encriptada).to eq 'miclavesegura'
  end

end
