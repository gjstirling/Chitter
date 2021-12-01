require 'pg'

def setup_test_database
  connect_to_db.exec("TRUNCATE posts RESTART IDENTITY;")
end 

def connect_to_db
  if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'chitter_test')
  else
    PG.connect(dbname: 'chitter')
  end
end 