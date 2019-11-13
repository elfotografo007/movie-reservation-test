FactoryBot.define do
    to_create { |instance| instance.save }
    factory :reservation do
        movie { create(:movie) }
        date { Date.today }
        n_seats { Faker::Number.between(from: 1, to: 10) }
        reservee { Faker::Name.name }
        email { Faker::Internet.email }
    end
end
