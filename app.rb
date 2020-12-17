require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks/add' do
    Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

  get '/bookmarks/update/:id' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/update'
  end

  post '/bookmarks/update' do
    Bookmark.update(id: params[:id], new_title: params[:new_title], new_url: params[:new_url])
    redirect '/bookmarks'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
