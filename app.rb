require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    erb :index
  end 

  get '/posts' do 
    @posts = Post.all
    erb :peeps
  end 

end 