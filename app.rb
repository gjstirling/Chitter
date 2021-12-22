# frozen_string_literal: true

require './required_files'

# Controller
class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  connect_to_db

  get '/' do
    @user = User.find(session[:user_id])
    erb :home
  end

  get '/posts' do
    @user = User.find(session[:user_id])
    @posts = Post.all
    erb :"posts/peeps"
  end

  get '/posts/new' do
    @user = User.find(session[:user_id])
    erb :"posts/new"
  end

  post '/posts' do
    flash[:notice] = 'A Post Cannot be blank' if Post.create(peep: params['peep'], user_id: session[:user_id]).nil?
    redirect '/posts'
  end

  get '/users/new' do
    signed_in? if !session[:user_id].nil?
    erb :'users/new'
  end

  post '/users' do
    details_error if missing_details? 
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

  private
  
  def details_error
    flash[:notice] = "You must fill in all fields to sign up"
    redirect '/users/new'
  end

  def missing_details? 
    params['email'].nil? || params['username'].nil? || params['password'].nil?
  end

  def signed_in 
    flash[:notice] = 'You are already signed in !'
    redirect '/'
  end 
end
