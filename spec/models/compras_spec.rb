require 'rails_helper'

RSpec.describe Compra, type: :model do
  subject do
    Compra.new(
        descripcion: "zapatilla",
        valor: 100
      )
  end

    it "no tiene descripcion" do
      subject.descripcion= nil
        expect(subject.valid?).to be(false)
    end

    it "no tiene valor" do
      subject.valor= nil
        expect(subject.valid?).to be(false)
    end

end
