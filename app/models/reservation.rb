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

        errors.add(:reservee, "can't be blank") if reservee.blank?
        errors.add(:date, "can't be blank") if date.blank?

        if movie.present?
            errors.add(:movie, 'is full') if movie.full?(date)
            if date && !movie.presenting?(date)
                errors.add(:movie, 'is not presenting on the desired date')
            end 
        else
            errors.add(:movie, "can't be blank")
        end
    end
end
