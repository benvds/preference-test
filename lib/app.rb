require 'sinatra/base'
require 'sinatra/reloader'
require './config/init'

class PreferencesQuestionaire < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.dirname(__FILE__) + '/../'
  enable :sessions

  def show_thanks_if_taken
    redirect 'thanks' if session['is_test_taken']
  end

  get '/' do
    erb :index
  end

  get '/test' do
    show_thanks_if_taken
    erb :test
  end

  post '/test' do
    show_thanks_if_taken

    if Preference.new(value: params[:value]).save
      session['is_test_taken'] = true
      redirect '/thanks'
    else
      # something went wrong...
      redirect '/test'
    end
  end

  get '/thanks' do
    session['shown_thanks'] = true
    erb :thanks
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
