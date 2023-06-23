require 'factory_bot'
require 'faker'
FactoryBot.define do
  factory :mensaje do
    id {Faker::Number.digit}
      contenido {"hola como estas"}
      nombre {"pepe"}
      emisor {"juanito"}
  end
end
