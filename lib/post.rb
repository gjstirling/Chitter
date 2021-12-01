require 'pg'
require '/Users/graemestirling/Chitter/spec/database_helpers.rb'

class Post
  def self.all 
    result = connect_to_db.exec('SELECT * FROM posts;')
    result.map { |post| 
      Post.new(
        peep: post['peep']
      )
    }
  end 

  def self.create(peep:)
    result = connect_to_db.exec_params(
      "INSERT INTO posts (peep) VALUES($1) RETURNING peep;", [peep]
    )
    Post.new(peep: result[0]['peep'])
  end

  attr_reader :peep

  def initialize(peep:)
    @peep = peep
  end
end 





# Time.new.strftime("%d/%m/%y %k:%M")