require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(0..100)
@color = "background: #0016FF;"
# @@guesses = 5

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)
  erb :index, :locals => {:secret_number => SECRET_NUMBER, :message => message, :color => @color}
end

def check_guess(guess)
  if guess > SECRET_NUMBER + 5
    @color = "background: #800000;"
    "Way too high!"
  elsif guess > SECRET_NUMBER
    @color = "background: #FFE4E1;"
    "Too high!"
  elsif guess < SECRET_NUMBER - 5
    @color = "background: #800000;"
    "Way too low!"
  elsif guess < SECRET_NUMBER
    @color = "background: #FFE4E1;"
    "Too low!"
  else
    @color = "background: #9ACD32;"
    "Yay! You got it right!! The SECRET NUMBER was #{SECRET_NUMBER}"
  end
end
