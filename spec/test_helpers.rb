# frozen_string_literal: true

def sign_in
  # Create a test user
  User.create(
    email: 'test@example.com', username: 'test_user', password: 'password123'
  )
  # Then sign in as them
  visit '/sessions/new'
  fill_in(:email, with: 'test@example.com')
  fill_in(:password, with: 'password123')
  click_button('Sign in')
end
