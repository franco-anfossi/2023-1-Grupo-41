require 'rails_helper'

RSpec.describe Producto, type: :model do
  subject do
    Producto.new(
        name: "zapatilla",
        talla: 123456789,
        precio: 100,
        color: "pink"
      )
  end

    it "no tiene descripcion" do
      subject.name= nil
        expect(subject.valid?).to be(false)
    end

    it "no tiene telefono" do
      subject.talla= nil
        expect(subject.valid?).to be(false)
    end

    it "no tiene email" do
      subject.precio= nil
        expect(subject.valid?).to be(false)
    end

    it "no tiene password" do
      subject.color= nil
        expect(subject.valid?).to be(false)
    end

end
