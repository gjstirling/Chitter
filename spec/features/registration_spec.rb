# frozen_string_literal: true

feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('username', with: 'test_diva')
    fill_in('password', with: 'password123')
    click_button('Create Account')

    expect(page).to have_content 'test_diva'
  end

  scenario 'a user cannot leave any fields blank' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('username', with: '   ')
    fill_in('password', with: 'password123')
    click_button('Create Account')

    expect(page).to have_content 'You must fill in all fields to sign up'
  end
end
