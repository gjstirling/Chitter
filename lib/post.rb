# frozen_string_literal: true

require_relative 'database_connection'
require './spec/database_helpers'
# Posts
class Post
  def self.all
    connect_to_db
    result = DatabaseConnection.query('SELECT * FROM posts')
    result.map do |post|
      Post.new(
        peep: post['peep'], time_stamp: post['time_stamp'], user_id: post['user_id']
      )
    end
  end

  def self.create(peep:, user_id:)
    return nil if peep.strip.empty?

    time_stamp = Time.new.strftime('%d/%m/%y %k:%M')

    connect_to_db
    result = DatabaseConnection.query(
      'INSERT INTO posts (peep, time_stamp, user_id) VALUES($1, $2, $3) RETURNING peep, time_stamp, user_id;', [peep, time_stamp, user_id]
    )
    Post.new(peep: result[0]['peep'], time_stamp: time_stamp, user_id: user_id)
  end

  def self.delete(id:)
    connect_to_db
    result = DatabaseConnection.query(
      'DELETE FROM posts WHERE id = $1', [id]
    )
  end 

  attr_reader :peep, :time_stamp, :user_id, :username

  def initialize(peep:, time_stamp:, user_id:, username: find_username(user_id))
    @peep = peep
    @time_stamp = time_stamp
    @user_id = user_id
    @username = username
  end

  private 
  
  def find_username(id)
    return "Unknown" if id.nil?
    connect_to_db
    result = DatabaseConnection.query(
      'SELECT username FROM users WHERE id = $1', [id]
    )
    result.entries[0]['username']
  end

end
