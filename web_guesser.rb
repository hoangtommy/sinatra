require 'sinatra'
require 'sinatra/reloader'
x = rand(101)

get '/' do
  "Shh, the SECRET nUmber is #{x}"
end