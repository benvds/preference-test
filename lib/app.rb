require 'sinatra/base'
require 'sinatra/reloader'
require 'JSON'
require 'pry'

class PreferencesQuestionaire < Sinatra::Base

  # binding.pry

  configure :development do
    register Sinatra::Reloader
  end

  RESOURCES = [
    { id:  1, name: 'first'},
    { id:  2, name: 'second'},
    { id:  3, name: 'third'}
  ]

  # list all
  get '/resources/?' do
    RESOURCES.to_json
  end

  # view one
  get '/resources/:id' do
    resource = RESOURCES.at(params[:id])
    return status 404 if resource.nil?
    resource.to_json
  end

  # create
  post '/resources' do
    RESOURCES.push(params['resource'])
    status 201
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
