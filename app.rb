require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'uri'
require './database_connection_setup'
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
    @user = User.find(session[:user_id])
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
    user = User.authenticate(email: params[:email], password: params[:password])
    if user 
      session[:user_id] = user.id
      redirect '/posts'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'
    end 
  end

end
