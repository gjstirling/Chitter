feature 'Adding a new post' do
  scenario 'A user can add a post' do
    Timecop.freeze(Time.parse('13/11/2021 10:30')) do 
      visit('/posts/new')
      fill_in('peep', with: 'I am a new post')
      click_button('Submit')

      expect(page).to have_content 'I am a new post'
      expect(page).to have_content '13/11/21 10:30'

    end
  end
end