require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the posts table
  connection.exec("TRUNCATE posts RESTART IDENTITY;")
end 