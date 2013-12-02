require 'sinatra/base'
require 'sinatra/reloader'
require './config/init'

class PreferencesQuestionaire < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.dirname(__FILE__) + '/../'

  get '/' do
    erb :index
  end

  get '/test' do
    erb :test
  end

  post '/test' do
    Preference.new(value: params[:value]).save
    redirect '/thanks'
  end

  get '/thanks' do
    erb :thanks
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
