describe '.create' do
  it 'creates a new user' do
    user = User.create(email: 'test@example.com', username: 'test_diva',password: 'password123')

    persisted_data = persisted_data(table: :users, id: user.id)

    expect(user).to be_a User
    expect(user.id).to eq persisted_data.first['id']
    expect(user.email).to eq 'test@example.com'
  end


  it 'hashes the password using BCrypt' do
    expect(BCrypt::Password).to receive(:create).with('password123')

    User.create(email: 'test@example.com', username: 'test_diva', password: 'password123')
  end
end

describe '.find' do
  it 'finds a user by ID' do
    user = User.create(email: 'test@example.com', username: 'test_diva', password: 'password123')
    result = User.find(user.id)

    expect(result.id).to eq user.id
    expect(result.email).to eq user.email
  end

  it 'returns nil if there is no id given' do
    expect(User.find(nil)).to eq nil
  end
end

describe '.authenticate' do
  # happy path, email and password are correct
  it 'returns a user given a correct username and password, if one exists' do
    user = User.create(email: 'test@example.com', username: 'test_diva', password: 'password123')
    authenticated_user = User.authenticate('test@example.com', 'password123')

    expect(authenticated_user.id).to eq user.id
  end
end
