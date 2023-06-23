require 'factory_bot'
FactoryBot.define do
  factory :resena do
    usuario {FactoryBot.create(:user)}
      id{Faker::Number.digit}
      contenido {"contenido resena"}
      calificacion {4}
  end
end
