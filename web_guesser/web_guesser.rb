require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

def check_guess(guess)
  if params["guess"].to_i > SECRET_NUMBER
  	message = "your guess was too high."
  elsif params["guess"].to_i < SECRET_NUMBER
  	message = "your guess was too low."
  else
  	message = "you guessed it! The secret number is #{SECRET_NUMBER}"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:message => message}
end