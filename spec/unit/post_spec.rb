# frozen_string_literal: true

describe '.all' do
  it 'returns all peeps' do
    Timecop.freeze(Time.parse('13/11/2021 10:30')) do
      PG.connect(dbname: 'chitter_test')

      # Add test data
      Post.create(peep: 'peep', user_id: nil)
      Post.create(peep: 'I am also a peep', user_id: nil)

      posts = Post.all

      expect(posts.first.peep).to eq 'peep'
      expect(posts.first.time_stamp).to eq '13/11/21 10:30'
    end
  end
end

describe '.create' do
  it 'creates a new post' do
    Timecop.freeze(Time.parse('13/11/2021 10:30')) do
      Post.create(peep: 'peep peep', user_id: nil)

      expect(Post.all.first.peep).to include 'peep peep'
    end
  end
end
