require 'factory_bot'
require 'faker'
FactoryBot.define do
  factory :subastum do
    id {Faker::Number.digit}
      base {"10"}
      estado {"disponible"}
  end
end