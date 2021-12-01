require 'pg'
require './spec/database_helpers'

class Post
  def self.all 
    result = connect_to_db.exec('SELECT * FROM posts;')
    result.map { |post| 
      Post.new(
        peep: post['peep'], time_stamp: post['time_stamp']
      )
    }
  end 

  def self.create(peep:)
    return nil if peep.strip.empty?
    time_stamp = Time.new.strftime("%d/%m/%y %k:%M")
    result = connect_to_db.exec_params(
      "INSERT INTO posts (peep, time_stamp) VALUES($1, $2) RETURNING peep, time_stamp;", [peep, time_stamp]
    )
    Post.new(peep: result[0]['peep'], time_stamp: time_stamp)
  end

  attr_reader :peep, :time_stamp

  def initialize(peep:, time_stamp:)
    @peep = peep
    @time_stamp = time_stamp
  end
end 


