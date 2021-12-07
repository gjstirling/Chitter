# frozen_string_literal: true

require './required_files'

# Controller
class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.find(session[:user_id])
    erb :home
  end

  get '/posts' do
    if session[:user_id].nil?
      flash[:notice] = 'You must be signed in to view posts'
      redirect '/'
    else
      @user = User.find(session[:user_id])
      @posts = Post.all
      erb :"posts/peeps"
    end
  end

  get '/posts/new' do
    erb :"posts/new"
  end

  post '/posts' do
    flash[:notice] = 'Post error' if Post.create(peep: params['peep']).nil?
    redirect '/posts'
  end

  get '/users/new' do
    if !session[:user_id].nil?
      flash[:notice] = 'You are already signed in !'
      redirect '/'
    else
      erb :'users/sign_up'
    end
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

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end
end
