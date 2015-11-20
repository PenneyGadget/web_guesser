require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(0..100)

get '/' do
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:secret_number => SECRET_NUMBER, :message => message}
end

def check_guess(guess)
  guess = guess.to_i
  if guess > SECRET_NUMBER + 5
    "Way too high!"
  elsif guess > SECRET_NUMBER
    "Too high!"
  elsif guess < SECRET_NUMBER - 5
    "Way too low!"
  elsif guess < SECRET_NUMBER
    "Too low!"
  else
    "Yay! You got it right!!"
  end
end
