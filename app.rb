require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'uri'
require '/Users/graemestirling/Chitter/spec/database_helpers.rb'
require '/Users/graemestirling/Chitter/lib/post.rb'
require '/Users/graemestirling/Chitter/lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.find(session[:user_id])
    erb :"home"
  end

  get '/posts' do
    @posts = Post.all
    erb :"posts/peeps"
  end

  get '/posts/new' do
    erb :"posts/new"
  end

  post '/posts' do
    flash[:notice] = "Post error" if Post.create(peep: params['peep']).nil?
    redirect '/posts'
  end

  get '/users/new' do
    erb :'users/sign_up'
  end

  post '/users' do
    user = User.create(email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :"/sessions/new"
  end

  post '/sessions' do
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = $1",
      [params[:email]]
    )
    user = User.new(result[0]['id'], result[0]['email'], result[0]['username'], result[0]['password'])

    session[:user_id] = user.id
    redirect('/posts')
  end

end
