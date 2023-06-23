require 'factory_bot'
require 'faker'
FactoryBot.define do
  factory :producto do
    id {Faker::Number.digit}
      name {"Pancho"}
      talla {40}
      precio {100}
      color {"pink"}
      imagen {Rack::Test::UploadedFile.new(Rails.root.join('spec','support','bob-esponja.png'),'image/png')}
  end
end
