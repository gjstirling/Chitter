describe '.all' do
  it 'returns all peeps' do
    peeps = Post.all

    expect(peeps).to include "I'm a peep"
    expect(bookmarks).to include "I am also a peep"
    expect(bookmarks).to include "Guess what I'm a peep too"
  end
end