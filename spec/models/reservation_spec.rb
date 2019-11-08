RSpec.describe Reservation do
    it 'responds to movie' do
        expect(Reservation.new).to respond_to(:movie_id)
    end

    it 'responds to date' do
        expect(Reservation.new).to respond_to(:date)
    end

    it 'responds to n_seats' do
        expect(Reservation.new).to respond_to(:n_seats)
    end

    it 'responds to reservee' do
        expect(Reservation.new).to respond_to(:reservee)
    end

    it 'responds to email' do
        expect(Reservation.new).to respond_to(:email)
    end

    it 'creates a reservation' do
        movie = create(:movie)
        date = Date.today
        reservee = Faker::Name.name
        email = Faker::Internet.email
        r = Reservation.create(movie: movie, date: date, reservee: reservee,
                               email: email, n_seats: 1)
        r.reload
        expect(r.movie).to eq(movie)
        expect(r.date).to eq(date)
        expect(r.reservee).to eq(reservee)
        expect(r.email).to eq(email)
        expect(r.n_seats).to eq(1)
    end

    it 'cannot allocate more than 10 seats' do
        r = build(:reservation, n_seats: 11)
        expect(r).not_to be_valid
    end

    it 'cannot allocate less than 1 seat' do
        r = build(:reservation, n_seats: 0)
        expect(r).not_to be_valid
    end

    context 'list' do
        it 'for a given date range' do
            today = Date.today
            tomorrow = today.next_day
            yesterday = today.prev_day
            r1 = create(:reservation, date: yesterday)
            r2 = create(:reservation, date: today)
            r3 = create(:reservation, date: tomorrow)
            r4 = create(:reservation, date: today.next_month)
            reservations = Reservation.by_date_range(yesterday, tomorrow)
            expect(reservations.to_a).to eq([r1, r2, r3])
            expect(reservations).not_to include(r4)
        end

        it 'with no matches' do
            reservations = Reservation.by_date_range(Date.today, Date.today)
            expect(reservations).to be_empty
        end
    end
end