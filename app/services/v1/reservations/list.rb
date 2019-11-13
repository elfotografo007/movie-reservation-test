module V1
    module Reservations
        class List
            include Dry::Transaction

            step :validate_params
            step :list

            private

            def validate_params(input)
                if input && input.include?(:start_date) && 
                   input.include?(:end_date)
                    Success(input)
                else
                    Failure('Missing start_date or end_date')
                end
            end

            def list(input)
                Success(Reservation.by_date_range(input[:start_date], 
                                                  input[:end_date]))
            end
        end
    end
end
