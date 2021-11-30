require '/Users/graemestirling/Chitter/spec/spec_helper.rb'

feature 'Landing page' do
  scenario 'Index page provides option to login or signup for Chitter' do
    visit ('/')
    expect(page).to have_content 'Chitter'
    expect(page).to have_selector(:link_or_button, 'Login')
    expect(page).to have_selector(:link_or_button, 'Sign up')
  end
end