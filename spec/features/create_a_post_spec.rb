feature 'Adding a new post' do
  scenario 'A user can add a post' do
    visit('/posts/new')
    fill_in('peep', with: 'I am a new post')
    click_button('Submit')

    expect(page).to have_content 'I am a new post'
  end
end