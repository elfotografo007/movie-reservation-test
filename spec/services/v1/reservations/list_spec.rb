RSpec.describe Services::V1::Reservations::List do
    subject { Services::V1::Reservations::List.new }
    it 'lists reservations correctly' do
        today = Date.new(2019, 11, 8)
        tomorrow = today.next_day
        yesterday = today.prev_day
        movie = create(:movie, thursday: true, friday: true, 
                        saturday: true, sunday: true)
        r1 = create(:reservation, date: yesterday, movie: movie)
        r2 = create(:reservation, date: today, movie: movie)
        r3 = create(:reservation, date: tomorrow, movie: movie)
        r4 = create(:reservation, date: today.next_month, movie: movie)
        result = subject.call(start_date: yesterday, end_date: tomorrow).value!
        expect(result.to_a).to eq([r1, r2, r3])
        expect(result).not_to include(r4)
    end

    it 'validates parameter presence' do
        result = subject.call
        expect(result.failure).to eq('Missing start_date or end_date')
    end
end
