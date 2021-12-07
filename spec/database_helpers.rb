# frozen_string_literal: true

require 'pg'

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
