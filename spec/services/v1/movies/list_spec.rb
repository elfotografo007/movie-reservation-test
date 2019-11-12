RSpec.describe V1::Movies::List do
    subject { V1::Movies::List.new }
    it 'list movies correctly' do
        movie1 = create(:movie, tuesday: true)
        movie2 = create(:movie, wednesday: true)
        movie3 = create(:movie, tuesday: true)
        result = subject.call({ day: 'tuesday' }).value!
        expect(result).to include(movie1)
        expect(result).not_to include(movie2)
        expect(result).to include(movie3)
    end

    it 'validates day parameter presence' do
        result = subject.call
        expect(result.failure).to eq('Missing day parameter')
    end

    it 'fails with invalid day' do
        result = subject.call({ day: 'morning' })
        expect(result.failure).to eq('The day is not valid')
    end
end
