require 'pry'
#require_relative 'config/environment.rb'

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
  puts "Which restaurant are you interested in?"
  resto = gets.chomp
  fixed = resto.downcase
  ##active record find by.name resto
  puts "Here's your restaurant: "
  binding.pry
  Restaurant.find_by(name: fixed)             #case-sensitive???
end

# binding.pry

## If no:
def get_sorting_method
  puts "*" * 45
  puts "Here are the restaurants in ½ mi radius from Flatiron. \n
  (If you want to walk farther than that, \n
  clearly you wouldn't be deciding what to eat from a terminal.)
  \n
  Select your sorting method: \n
  A) Sort by price.
  B) Sort by rating. (You bougie.) \n
  Answer 'A' or 'B'."
  # use gets to capture the user's input. This method should return that input, downcased.
  sort_meth = gets.chomp.downcase
end

def choose_resto(sort_meth)
    puts "*" * 45
    puts "Here's a list of restaurants near you."
    sort_meth = sort_meth

    # sort by sort_meth (if A, then ... if B, then...)
    if sort_meth == "a"
      Restaurant.order(:price)
    else
      Restaurant.order(:rating)
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
  puts "Go enjoy your lunch. Or dinner. Or snack.  Learn, love, code."
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

  if (sort_meth == 'b'|| sort_meth =='a')
      choose_resto(sort_meth)
      know_resto
  else
    try_again
    step2
  end

end
