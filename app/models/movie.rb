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
end