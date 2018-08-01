require_relative '../config/environment'
# require 'rest-client'
# require 'json'
# require 'pry'
# require_relative 'sample'
# require_relative 'dmu_cli'



puts "HELLO WORLD"

def show_restos
  #make the web request
  #insert response string here
  response_hash = JSON.parse(response_string)
  businesses = response_hash["businesses"]

end

# def parsing

  restaurants = show_restos.map do |biz|
    {
      name: biz['name'],
      rating: biz['rating'],
      price: biz['price'],
      address: biz['location']['display_address'].join(', '),
      phone: biz['phone']
    }
  end
  binding.pry

  retaurants.each do |r|
    Restaurant.create(r)
  end
