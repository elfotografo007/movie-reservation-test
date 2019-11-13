Sequel.migration do
  change do
    create_table(:reservations) do
      primary_key :id
      foreign_key :movie_id, :movies
      Date :date, null: false
      Integer :n_seats, null: false, default: 1
      String :reservee, null: false
      String :email, null: false
    end
  end
end
