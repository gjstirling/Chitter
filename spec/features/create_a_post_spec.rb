# frozen_string_literal: true

feature 'Adding a new post' do
  scenario 'A user can add a post' do
    Timecop.freeze(Time.parse('13/11/2021 10:30')) do
      sign_in
      visit('/posts/new')
      fill_in('peep', with: 'I am a new post')
      click_button('Submit')

      expect(page).to have_content 'I am a new post'
      expect(page).to have_content '13/11/21 10:30'
    end
  end

  scenario 'Blank posts are not posted' do
    visit('/posts/new')
    fill_in('peep', with: '   ')
    click_button('Submit')
    expect(Post.all).to be_empty
  end
end
