require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see posts' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO posts VALUES(1, 'peep');")
    connection.exec("INSERT INTO posts VALUES(2, 'I am also a peep');")

    visit('/posts')

    expect(page).to have_content "peep"
    expect(page).to have_content "I am also a peep"

  end
end