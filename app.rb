require 'sinatra/base'
require 'sinatra/reloader'
require '/Users/graemestirling/Chitter/lib/post.rb'

class Chitter < Sinatra::Base

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
    peep = params['peep']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO posts (peep) VALUES('#{peep}')")
    redirect '/posts'
  end 

end 