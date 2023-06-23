require 'factory_bot'
require 'faker'
FactoryBot.define do
  factory :chat do
    id {Faker::Number.digit}
      asunto {"saludo"}
  end
end
