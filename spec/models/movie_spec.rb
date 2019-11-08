RSpec.describe Movie do
    it 'responds to name' do
        expect(Movie.new).to respond_to(:name)
    end

    it 'responds to description' do
        expect(Movie.new).to respond_to(:description)
    end

    it 'responds to url' do
        expect(Movie.new).to respond_to(:url)
    end

    it 'responds to monday' do
        expect(Movie.new).to respond_to(:monday)
    end

    it 'responds to tuesday' do
        expect(Movie.new).to respond_to(:tuesday)
    end

    it 'responds to wednesday' do
        expect(Movie.new).to respond_to(:wednesday)
    end

    it 'responds to thursday' do
        expect(Movie.new).to respond_to(:thursday)
    end

    it 'responds to friday' do
        expect(Movie.new).to respond_to(:friday)
    end

    it 'responds to saturday' do
        expect(Movie.new).to respond_to(:saturday)
    end

    it 'responds to sunday' do
        expect(Movie.new).to respond_to(:sunday)
    end

    it 'responds to reservations' do
        expect(Movie.new).to respond_to(:reservations)
    end

    it 'calculates if it is full' do
        movie = create(:movie, friday: true)
        r = create(:reservation, movie: movie, n_seats: 10, 
                   date: Date.new(2019, 11, 8))
        expect(movie.full?(r.date)).to be_truthy
    end

    it 'calculates if it is presenting in a day' do
        movie = create(:movie, tuesday: true)
        expect(movie.presenting?(Date.new(2019, 11, 5))).to be_truthy
    end

    it 'creates a movie' do
        name = 'My name'
        description = 'My description'
        url = 'https://myurl'
        m = Movie.create(name: name, description: description, url: url,
                         wednesday: true)
        m.reload
        expect(m.name).to eq(name)
        expect(m.description).to eq(description)
        expect(m.url).to eq(url)
        expect(m.monday).to be_falsey
        expect(m.wednesday).to be_truthy
        expect(m.friday).to be_falsey
    end

    context 'list' do
        it 'for a given day' do
            movie1 = create(:movie, tuesday: true)
            movie2 = create(:movie, wednesday: true)
            movie3 = create(:movie, tuesday: true)
            movies = Movie.by_day(:tuesday)
            expect(movies).to include(movie1)
            expect(movies).not_to include(movie2)
            expect(movies).to include(movie3)
        end

        it 'with no matches' do
            movie1 = create(:movie, tuesday: true)
            movies = Movie.by_day(:wednesday)
            expect(movies).to be_empty
        end

        it 'raises error with wrong argument' do
            expect { Movie.by_day(:d) }.to raise_error(ArgumentError)
        end
    end
end