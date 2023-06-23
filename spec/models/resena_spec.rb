require 'rails_helper'

RSpec.describe Resena, type: :model do
  subject do
    Resena.new(
        usuario: "Juan",
        contenido: "Muy buen producto",
        calificacion: 5
      )
  end

    it "no tiene usuario" do
      subject.usuario= nil
        expect(subject.valid?).to be(false)
    end

    it "no tiene contenido" do
      subject.contenido= nil
        expect(subject.valid?).to be(false)
    end

    it "no tiene calificacion" do
      subject.calificacion= nil
        expect(subject.valid?).to be(false)
    end

end