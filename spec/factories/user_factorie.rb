require 'factory_bot'
require 'faker'
FactoryBot.define do
  factory :user, class: User do
    id {Faker::Number.digit}
      email {Faker::Internet.email}
      password {"123456"}
      name {"Pancho"}
      telefono {987654327}
      descripcion {"Me llamo pancho"}
      imagen {Rack::Test::UploadedFile.new(Rails.root.join('spec','support','bob-esponja.png'),'image/png')}
  end
    factory :user2, class: User do
      id {10}
        email {Faker::Internet.email}
        password {"123456"}
        name {"Pancho"}
        telefono {987654327}
        descripcion {"Me llamo pancho"}
        imagen {Rack::Test::UploadedFile.new(Rails.root.join('spec','support','bob-esponja.png'),'image/png')}
    end
end

