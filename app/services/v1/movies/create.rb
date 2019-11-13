module V1
    module Movies
        class Create
            include Dry::Transaction

            step :validate_params
            step :create

            private

            def validate_params(input)
                whitelist = [:name, :description, :url, :monday, :tuesday, 
                             :wednesday, :thursday, :friday, :saturday, :sunday]
                if input
                    input.transform_keys(&:to_sym)
                    Success(input.slice(*whitelist))
                else
                    Failure('Missing input')
                end
            end

            def create(input)
                movie = Movie.new(input)
                if movie.valid? && movie.save
                    Success(movie)
                else
                    Failure(movie.errors)
                end
            end
        end
    end
end
