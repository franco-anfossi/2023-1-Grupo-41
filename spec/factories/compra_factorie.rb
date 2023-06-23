require 'factory_bot'
require 'faker'
FactoryBot.define do
  factory :compra do
    id {Faker::Number.digit}
      valor {100}
      descripcion {"zapatillas"}
      estado {"Aprobada"}
  end
end