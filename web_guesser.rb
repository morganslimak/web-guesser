require 'sinatra'
require 'sinatra/reloader'
require 'pry'

NUMBER = rand(101)

def check_guess(guess)
  message = case
    when guess.nil? then "Guess a number!"
    when guess.to_i - 5 > NUMBER then "Way too high!"
    when guess.to_i + 5 < NUMBER then "Way too low!"
    when guess.to_i > NUMBER then "Too high!"
    when guess.to_i < NUMBER then "Too low!"
    when guess.to_i == NUMBER then "Correct!"
  end
end

def set_color(guess)
  color = case
    when guess.nil? then "#ffffff"
    when guess.to_i - 5 > NUMBER || guess.to_i + 5 < NUMBER then "#FF170D"
    when guess.to_i > NUMBER || guess.to_i < NUMBER then "#780B06"
    when guess.to_i == NUMBER then "#11FF0D"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color = set_color(guess)
  erb :index, :locals => {:number => NUMBER,
                          :message => message,
                          :color => color}
end
