Sequel.migration do
    change do
      create_table(:movies) do
        primary_key :id
        String :name, null: false
        String :description, null: false, text: true
        String :url, null: false
        FalseClass :monday, null: false, default: false
        FalseClass :tuesday, null: false, default: false
        FalseClass :wednesday, null: false, default: false
        FalseClass :thursday, null: false, default: false
        FalseClass :friday, null: false, default: false
        FalseClass :saturday, null: false, default: false
        FalseClass :sunday, null: false, default: false
      end
    end
  end