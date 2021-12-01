describe '.all' do
  it 'returns all peeps' do
    Timecop.freeze(Time.parse('13/11/2021 10:30')) do 
      connection = PG.connect(dbname: 'chitter_test')

      #Add test data 
      Post.create(peep: 'peep')
      Post.create(peep: 'I am also a peep')
      

      posts = Post.all

      expect(posts.first.peep).to eq 'peep'
      expect(posts.first.time_stamp).to eq '13/11/21 10:30'
    end
  end
end

describe '.create' do
  it 'creates a new post' do
    Timecop.freeze(Time.parse('13/11/2021 10:30')) do 
      Post.create(peep: 'peep peep')

      expect(Post.all.first.peep).to include 'peep peep'
    end
  end

  it 'rejects empty posts' do
    expect { Post.create(peep: '') }.to raise_error 'Peep has no content'
  end
end