require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE posts RESTART IDENTITY;")
end 

def connect_to_db
  if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'chitter_test')
  else
    PG.connect(dbname: 'chitter')
  end
end 