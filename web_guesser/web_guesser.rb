require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

def check_guess(guess)
  if guess === SECRET_NUMBER
  	message = "you guessed it! The secret number is #{SECRET_NUMBER}"
  elsif guess - 5 > SECRET_NUMBER
    message = 'way too high'
  elsif guess > SECRET_NUMBER
  	message = "your guess was too high."
  elsif guess + 5 < SECRET_NUMBER
  	message = 'way too low'
  elsif guess < SECRET_NUMBER
  	message = 'your guess is too low'
  end
end

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:message => message}
end