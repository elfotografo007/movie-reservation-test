RSpec.describe API::V1 do 
    include Rack::Test::Methods

    def app
        API::V1
    end

    context 'GET /movies' do
        it 'list movies correctly' do
            movie1 = create(:movie, tuesday: true)
            movie2 = create(:movie, wednesday: true)
            movie3 = create(:movie, tuesday: true)
            get '/movies?day=tuesday'
            #'CONTENT_TYPE' => 'application/json'
            expect(last_response.status).to eq(200)
            body = JSON.parse(last_response.body)
            expect(body.count).to eq(2)
            expect(body).to include(movie1.to_hash.transform_keys(&:to_s))
            expect(body).not_to include(movie2.to_hash.transform_keys(&:to_s))
            expect(body).to include(movie3.to_hash.transform_keys(&:to_s))
        end

        it 'requires day parameter' do
            get '/movies'
            expect(last_response.status).to eq(400)
            expect(JSON.parse(last_response.body)['error'])
                .to eq('day is missing')
        end

        it 'returns error on wrong day' do
            get '/movies?day=batman'
            expect(last_response.status).to eq(500)
            expect(JSON.parse(last_response.body)['error'])
                .to eq('The day is not valid')
        end
    end
end
