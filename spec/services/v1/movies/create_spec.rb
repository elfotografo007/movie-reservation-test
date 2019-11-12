RSpec.describe V1::Movies::Create do
    subject { V1::Movies::Create.new }
    it 'creates movie correctly' do
        movie1 = build(:movie, tuesday: true)
        result = subject.call(movie1.to_hash).value!
        expect(result.name).to eq(movie1.name)
        expect(result.description).to eq(movie1.description)
        expect(result.monday).to be_falsey
        expect(result.tuesday).to be_truthy
    end

    it 'validates parameter presence' do
        result = subject.call
        expect(result.failure).to eq('Missing input')
    end

    it 'fails with invalid movie' do
        result = subject.call({ name: Faker::DcComics.title })
        expect(result.failure).to include(:description)
        expect(result.failure).to include(:url)
    end
end
