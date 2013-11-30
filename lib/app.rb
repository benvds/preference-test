require 'sinatra/base'
require 'sinatra/reloader'
require 'JSON'
# require 'pry'

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
  get '/' do
    # RESOURCES.to_json
    status 200
  end

  # view one
  get '/:id' do
    resource = RESOURCES.at(params[:id])
    return status 404 if resource.nil?
    resource.to_json
  end

  # create
  post '/' do
    RESOURCES.push(params['resource'])
    status 201
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
