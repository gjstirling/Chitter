require 'pg'

def setup_test_database
  connect_to_db.exec("TRUNCATE posts RESTART IDENTITY;")
end 

def connect_to_db
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('chitter_test')
  else
    DatabaseConnection.setup('chitter')
  end
end 