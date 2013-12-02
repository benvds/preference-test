migration 'create preferences' do
  database.create_table :preferences do
    primary_key :id
    String :value
  end
end
