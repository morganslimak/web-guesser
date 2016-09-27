require 'sinatra'
require 'sinatra/reloader'
require 'pry'

NUMBER = rand(101)

def check_guess(guess)
  return if guess.nil?
  message = case
    when guess.to_i - 5 > NUMBER then "Way too high!"
    when guess.to_i + 5 < NUMBER then "Way too low!"
    when guess.to_i > NUMBER then "Too high!"
    when guess.to_i < NUMBER then "Too low!"
    when guess.to_i == NUMBER then "Correct!"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => NUMBER, :message => message}
end
