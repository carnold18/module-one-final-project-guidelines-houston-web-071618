require_relative '../config/environment'
# require 'rest-client'
# require 'json'
# require 'pry'
# require_relative 'sample'
# require_relative 'dmu_cli'



puts "HELLO WORLD"

def show_restos
  #make the web request
  response_string = RestClient.get('https://api.yelp.com/v3/businesses/search?term=lunch&latitude=29.759100&longitude=-95.363398', headers = {content_type: "application/json;charset=utf-8", authorization: "Bearer gb3UoP4_mDCbbesnotPRvqKRj3R5-kZqGb67P1KlwvdFIp56El2A1xS3hX-z9ZSAzcS7DprwsHr784OZCNosQ_OYNQWZziR-GAebOOJNRjSDMngxFuvc4F8ki-dhW3Yx"})
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
