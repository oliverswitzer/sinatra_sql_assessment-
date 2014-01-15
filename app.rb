
require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

set :database, "sqlite3:///blog.db"

class App < Sinatra::Application

  #INDEX
  get '/spacecats' do
    @spacecats = SpaceCat.all

    haml :'/spacecats/index'
  end


  #NEW
  get '/spacecats/new' do
    @spacecat = SpaceCat.new
    haml :'/spacecats/new'
  end

  #SHOW
  get '/spacecats/:id' do
    @spacecat = SpaceCat.find(params[:id])
    haml :'/spacecats/show'
  end

  

  #CREATE
  post '/spacecats' do
    @spacecat = SpaceCat.new(params[:spacecat])
    if @spacecat.save
      redirect to('/spacecats')
    else
      haml :'spacecats/new'
    end
  end

  # #EDIT
  # get '/spacecats/:id/edit' do
  #   @spacecat = spacecat.find(params[:id])
  # end

  # #UPDATE
  # put 'spacecats/:id' do
  #   @spacecat = spacecat.find(params[:id])
  #   if @spacecat.update_attributes
  #     redirect to('/spacecats/#{@spacecat.id}')
  #   else
  #     haml :'spacecats/edit'
  #   end
  # end



end