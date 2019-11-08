class Reservation < Sequel::Model(:reservations)
    many_to_one :movie

    dataset_module do
        def by_date_range(star_date, end_date)
            where(date: star_date..end_date).order(:date)
        end
    end

    def validate
        super
        unless (1..10).include?(n_seats)
            errors.add(:n_seats, 'Must be between 1 and 10')
        end
    end
end