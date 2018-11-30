require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

def check_guess(guess)
  if guess === SECRET_NUMBER
  	message = "you guessed it! The secret number is #{SECRET_NUMBER}"
  elsif guess - 5 > SECRET_NUMBER
    message = 'way too high'
  elsif guess > SECRET_NUMBER
  	message = "a little high."
  elsif guess + 5 < SECRET_NUMBER
  	message = 'way too low'
  elsif guess < SECRET_NUMBER
  	message = 'a little low'
  end
end

def get_color(guess)
  if guess === SECRET_NUMBER
  	color = 'green'
  elsif guess + 5 < SECRET_NUMBER || guess - 5 > SECRET_NUMBER
  	color = 'red'
  else
  	color = 'pink'
  end
end

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  color = get_color(guess)
  erb :index, :locals => {:message => message, :color => color}
end