require 'pry'
require_relative 'config/environment.rb'

def welcome
    puts "Welcome to CJ's 8-ball of lunch options.
    You are at Flatiron School Houston.
    You are hungry. Help me help you decide where to find food."
end

def get_do_you_know
  puts "*" * 45
  puts "Do you know the name of the restaurant you want to order from?
  Answer 'yes' or 'no'."
  # use gets to capture the user's input. This method should return that input, downcased.
  yesno = gets.chomp.downcase
end


## If yes, find by name.
def know_resto
  puts "*" * 45
  puts "Which restaurant are you interested in? (Type in the name using proper nouns.)"
  resto = gets.chomp
  #fixed = resto.downcase
  ##active record find by.name resto
  puts "Here's your restaurant: "
  choice = Restaurant.find_by(name: resto)             #case-sensitive???
    puts choice.name+", rated: "+"#{choice.rating}"+"; great choice! \n Call now: "+choice.phone

  #binding.pry
end

# binding.pry

## If no:
def get_sorting_method
  puts "*" * 45
  puts "I'll give you the restaurants in 1/4 mi radius from Flatiron. \n
  (If you want to walk farther than that,
  clearly you wouldn't be deciding what to eat from a terminal.)
  \n
  Select your sorting method: \n
  P) Sort by price.
  R) Sort by rating. (You bougie.) \n
  Answer 'P' or 'R'."
  # use gets to capture the user's input. This method should return that input, downcased.
  sort_meth = gets.chomp.downcase
end

def choose_resto(sort_meth)
    puts "*" * 45
    puts "Here's a list of 10 restaurants near you."
    sort_meth = sort_meth

    # sort by sort_meth (if A, then ... if B, then...)
    if sort_meth == "p"
      #binding.pry
      count = 1
      Restaurant.order(:price)[0..9].each do |restaurant|
        puts "#{count}. " + restaurant.name+", with price range: "+ restaurant.price + " and rated: "+"#{restaurant.rating}"+"; #: "+restaurant.phone
        count += 1
      end


    else
      count = 1
      Restaurant.order(:rating)[0..9].each do |restaurant|
        puts "#{count}. " + restaurant.name+", rated: "+"#{restaurant.rating}"+", with price range: "+ restaurant.price + "; #: "+restaurant.phone
        count += 1
      end


    end

    # puts "Select a restaurant."
    #
    # resto = gets.chomp.downcase

end

def try_again
  p "That's not an option.  Try again."
end

def enjoy
  puts "*" * 45
  puts "Go enjoy your lunch. Or dinner. Or snack.  \n Learn, love, code."
end

def step1
  yesno = get_do_you_know

  if (yesno == 'yes')
    know_resto

  elsif (yesno == 'no')
    step2

  else
    try_again
    step1
  end
end


def step2
  sort_meth = get_sorting_method

  if (sort_meth == 'p'|| sort_meth =='r')
      choose_resto(sort_meth)
      know_resto
  else
    try_again
    step2
  end

end
