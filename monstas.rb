require 'sinatra'
require 'sinatra/reloader'
require 'erb'

get "/" do
  "OMG, hello Ruby Monstas!"
end

get "/monstas/:name"  do
  template = "<h1>Hello <%= name %></h1>"
  layout = "<html><body><%= yield %></body></html>"
  erb template, { :locals => params, :layout => layout }
  # erb "<h1>Wuddup <%= name %></h1>", { :locals => { :name => params[:name] } }
  # ERB.new("<h1>Howdy <%= params[:name] %></h1>").result(binding)
  # params.inspect
  # "Hello #{params["name"]}!"
end