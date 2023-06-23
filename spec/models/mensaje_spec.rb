require 'rails_helper'

RSpec.describe Mensaje, type: :model do
  subject do
    Mensaje.new(
        contenido: "Hola qué tal?"
      )
  end

    it "no tiene contenido" do
      subject.contenido= nil
        expect(subject.valid?).to be(false)
    end

end