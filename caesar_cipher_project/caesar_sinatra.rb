require 'sinatra'
require 'sinatra/reloader'

message = 'Caesar Cipher Encoder'

get '/' do
  erb :index, :locals => { :message => message }
end