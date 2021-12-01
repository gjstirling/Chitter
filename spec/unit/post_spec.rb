describe '.all' do
  it 'returns all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    #Add test data 
    connection.exec("INSERT INTO posts (peep) VALUES ('peep');")
    connection.exec("INSERT INTO posts (peep) VALUES ('I am also a peep');")

    posts = Post.all

    expect(posts.length).to eq 2
    expect(posts.first).to be_a Post
    expect(posts.first.peep).to eq 'peep'
  end
end

describe '.create' do
  it 'creates a new post' do
    Post.create(peep: 'peep peep')

    expect(Post.all.first.peep).to include 'peep peep'
  end
end