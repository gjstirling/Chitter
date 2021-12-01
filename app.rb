require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require 'uri'
require '/Users/graemestirling/Chitter/spec/database_helpers.rb'
require '/Users/graemestirling/Chitter/lib/post.rb'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    erb :"posts/index"
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

end 