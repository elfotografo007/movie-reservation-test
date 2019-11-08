FactoryBot.define do
to_create { |instance| instance.save }
    factory :movie do
        name { Faker::DcComics.title }
        description { Faker::Movies::StarWars.quote }
        url { Faker::Internet.url }
        monday { false }
        tuesday { false }
        wednesday { false }
        thursday { false }
        friday { false }
        saturday { false }
        sunday { false }
    end
end