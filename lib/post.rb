class Post
  def self.all 
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM posts;')
    result.map { |post| post['peep'] }
  end 
end 