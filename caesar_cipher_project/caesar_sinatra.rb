require 'sinatra'
require 'sinatra/reloader'

message = 'sup sup world!'

get '/' do
  erb :index, :locals => { :message => message }
end