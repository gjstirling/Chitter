feature 'authentication' do
  it 'a user can sign in' do
    # Create a test user
    User.create(email: 'test@example.com', username: 'test_diva', password: 'password123')

    # Then sign in as them
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_content 'Welcome, test_diva'
  end
end
