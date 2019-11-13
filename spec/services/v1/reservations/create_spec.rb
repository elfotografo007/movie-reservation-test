RSpec.describe Services::V1::Reservations::Create do
    subject { Services::V1::Reservations::Create.new }
    it 'creates a reservation correctly' do
        movie = create(:movie, monday: true)
        date = Date.new(2019, 11, 4)
        reservation = build(:reservation, movie: movie, date: date)
        result = subject.call(reservation.to_hash).value!
        expect(result.movie).to eq(movie)
        expect(result.date).to eq(date)
        expect(result.reservee).to eq(reservation.reservee)
        expect(result.email).to eq(reservation.email)
        expect(result.n_seats).to eq(reservation.n_seats)
    end

    it 'validates parameter presence' do
        result = subject.call
        expect(result.failure).to eq('Missing input')
    end

    it 'fails with invalid movie' do
        movie = create(:movie)
        date = Date.new(2019, 11, 5)
        result = subject.call(n_seats: 11, movie_id: movie.id, date: date)
        expect(result.failure).to include(:n_seats)
        expect(result.failure).to include(:movie)
    end
end
