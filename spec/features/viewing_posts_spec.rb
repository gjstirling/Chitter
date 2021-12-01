require 'pg'

feature 'Viewing posts' do
  scenario 'A user can see posts' do
    Timecop.freeze(Time.parse('13/11/2021 10:30')) do 
      # Add the test data
      Post.create(peep: 'peep')
      Post.create(peep: 'I am also a peep')
    
      visit('/posts')

      expect(page).to have_content "peep"
      expect(page).to have_content "I am also a peep"
    end 
  end
end