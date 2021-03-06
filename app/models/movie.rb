class Movie < Sequel::Model(:movies)
    one_to_many :reservations
    DAYS = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday,
            :sunday]
    dataset_module do
        def by_day(day)
            raise ArgumentError unless DAYS.include?(day.to_sym)
            where(day.to_sym => true) 
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

    def validate
        super
        errors.add(:name, "can't be blank") if name.blank?
        errors.add(:description, "can't be blank") if description.blank?
        errors.add(:url, "can't be blank") if url.blank?
    end
end
