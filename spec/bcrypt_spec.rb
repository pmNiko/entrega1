require_relative '../bcrypt'

describe Bcrypt do

  it "Se valida una clave luego de ser encriptada" do
      clave = Bcrypt.new.encriptar 'miclavesegura'
      expect(Bcrypt.new.validar 'miclavesegura',clave ).to eq true
  end

end
