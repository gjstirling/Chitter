feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('username', with: 'test_diva')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome to chitter, test_diva"
  end
end