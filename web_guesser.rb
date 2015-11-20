require 'sinatra'
require 'sinatra/reloader'

def initialize
  @number = rand(0..100)
end

get '/' do
  "The super SECRET NUMBER is: #{@number}"
end
