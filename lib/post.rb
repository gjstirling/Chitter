class Post
  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM posts;')
    result.map { |post| 
      Post.new(
        peep: post['peep']
      )
    }
  end 

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO posts (peep) VALUES('#{peep}')")
  end


  attr_reader :peep

  def initialize(peep:)
    @peep = peep
  end
end 





# Time.new.strftime("%d/%m/%y %k:%M")