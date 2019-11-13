module V1
    module Reservations
        class Create
            include Dry::Transaction

            step :validate_params
            step :create

            private

            def validate_params(input)
                whitelist = [:movie_id, :date, :n_seats, :reservee, :email]
                if input
                    input.transform_keys(&:to_sym)
                    Success(input.slice(*whitelist))
                else
                    Failure('Missing input')
                end
            end

            def create(input)
                reservation = Reservation.new(input)
                if reservation.valid? && reservation.save
                    Success(reservation)
                else
                    Failure(reservation.errors)
                end
            end
        end
    end
end
