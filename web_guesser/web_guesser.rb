
require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
# @@guesses_left = 5

# def reset
#   @@guesses_left = 5
#   message = 'new game, new number, new guesses'
# end

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
  # to-fix: subtracting guesses left is only happening once here. need to create a loop?
  # @@guesses_left -= 1
  color = get_color(guess)
  erb :index, :locals => {:message => message, :color => color}
end