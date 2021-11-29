require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end 

  get '/login' do 
    erb :login
  end 

  get '/signup' do 
    erb :signup
  end 


end 