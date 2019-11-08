class Movie < Sequel::Model(:movies)
    one_to_many :reservations
    DAYS = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday,
            :sunday]
    dataset_module do
        def by_day(day)
            raise ArgumentError unless DAYS.include?(day.to_sym)
            where(day => true) 
        end
    end

    def full?(date)
        n_seats = Reservation.where(date: date, movie_id: self.id)
                             .sum(:n_seats) || 0
        n_seats >= 10
    end

    def presenting?(date)
        day_of_week = date.strftime("%A").downcase
        self.send(day_of_week)
    end
end