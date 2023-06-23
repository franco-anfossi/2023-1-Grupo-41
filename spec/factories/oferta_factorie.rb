require 'factory_bot'
require 'faker'
FactoryBot.define do
  factory :ofertum do
    id {Faker::Number.digit}
      monto {"10"}
      estado {"disponible"}
      ofertor {"pepe"}
  end
end