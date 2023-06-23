require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
        descripcion: "zapatilla",
        telefono: 123456789,
        email: "test@example.com",
        password: "password"
      )
  end

    it "no tiene descripcion" do
      subject.descripcion= nil
        expect(subject.valid?).to be(false)
    end

    it "no tiene telefono" do
      subject.telefono= nil
        expect(subject.valid?).to be(false)
    end

    it "no tiene email" do
      subject.email= nil
        expect(subject.valid?).to be(false)
    end

    it "no tiene password" do
      subject.password= nil
        expect(subject.valid?).to be(false)
    end

end
