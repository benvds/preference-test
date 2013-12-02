require 'sinatra'
require 'sinatra/sequel'
require 'sqlite3'

configure :development do
  set :database, 'sqlite://db/development.sqlite'
end
configure :test do
  set :database, 'sqlite::memory:'
end

require './config/migrations'

Dir["./lib/models/**/*.rb"].each{|model|
  require model
}

