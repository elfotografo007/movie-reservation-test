
db_url = ENV['MV_DATABASE_URL'] || 'postgresql://postgres@127.0.0.1:5432/mv_db'
DB = Sequel.connect(db_url)
