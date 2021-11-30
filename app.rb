require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end 

  get '/users' do 
    erb :login
  end 

  get '/users/new' do 
    erb :signup
  end 

  post '/users' do 
    # create the user and then...
    p params 
    redirect('/users')
  end 


end 