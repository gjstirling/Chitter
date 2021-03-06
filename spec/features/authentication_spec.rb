# frozen_string_literal: true

feature 'authentication' do
  scenario 'a user can sucessfully signs in' do
    sign_in

    expect(page).to have_content 'Logged in as - test_user'
  end

  scenario 'a user sees an error if they get their email wrong' do
    User.create(
      email: 'test@example.com', username: 'test_user', password: 'password123'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome test_user'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(
      email: 'test@example.com', username: 'test_user', password: 'password123'
    )

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test_user'
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'a user can sign out' do
    # Create the user
    User.create(
      email: 'test@example.com', username: 'test_user', password: 'password123'
    )

    # Sign in as that user
    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    # Sign out
    click_button('Sign out')

    expect(page).not_to have_content 'Welcome test_user'
    expect(page).to have_content 'You have signed out.'
  end
end
