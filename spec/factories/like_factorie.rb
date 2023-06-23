require 'factory_bot'
require 'faker'
FactoryBot.define do
  factory :like do
    id {Faker::Number.digit}
  end
end