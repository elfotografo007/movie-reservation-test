module API
    class V1 < Grape::API
        format :json

        resources :movies do
            desc 'List movies for a given day'
            params do
                requires :day, type: String, desc: 'Day of week'
            end
            get do
                Services::V1::Movies::List.new.call(params) do |m|
                    m.success do |movies|
                       movies.map(&:to_hash)
                    end
                
                    m.failure do |error|
                        error!({ error: error }, 500)
                    end
                end
            end
        end
    end
end
