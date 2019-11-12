module V1
    module Movies
        class List
            include Dry::Transaction

            step :validate_params
            step :list

            private

            def validate_params(input)
                if input && input.include?(:day)
                    Success(input[:day])
                else
                    Failure('Missing day parameter')
                end
            end

            def list(input)
                Success(Movie.by_day(input))
            rescue ArgumentError
                Failure('The day is not valid')
            end
        end
    end
end