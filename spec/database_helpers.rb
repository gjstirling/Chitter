require 'pg'

def setup_test_database
  connect_to_db.exec("TRUNCATE posts, users RESTART IDENTITY;")
end 

def connect_to_db
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('chitter_test')
  else
    DatabaseConnection.setup('chitter')
  end
end

def persisted_data(id:, table:)
  connection = connect_to_db
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end 
