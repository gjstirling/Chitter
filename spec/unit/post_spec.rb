describe '.all' do
  it 'returns all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    #Add test data 
    connection.exec("INSERT INTO posts (peep) VALUES ('peep');")
    connection.exec("INSERT INTO posts (peep) VALUES ('I am also a peep');")

    posts = Post.all

    expect(posts).to include "peep"
    expect(posts).to include "I am also a peep"
  end
end