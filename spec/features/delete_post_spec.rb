feature 'Deleting a post' do
  scenario 'A user can delete their posts' do
    Timecop.freeze(Time.parse('13/11/2021 10:30')) do
      sign_in
      visit('/posts/new')
      fill_in('peep', with: 'I am a new post')
      click_button('Create Post')

      click_button('Delete')
      expect(page).not_to have_content 'I am a new post'
      expect(page).not_to have_content '13/11/21 10:30'
    end
  end
end 