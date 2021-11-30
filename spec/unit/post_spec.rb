describe '.all' do
  it 'returns all peeps' do
    peeps = Post.all

    expect(peeps).to include "peep"
    expect(peeps).to include "I am also a peep"
  end
end