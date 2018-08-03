require 'rest-client'
require 'json'
require 'pry'
#require_relative '../sample'
require_relative '../cli'

def show_restos
  response_string = RestClient.get('https://api.yelp.com/v3/businesses/search?term=lunch&latitude=29.759100&longitude=-95.363398&radius=400&open_now=true', headers = {content_type: "application/json;charset=utf-8", authorization: "Bearer JXu7Wwa0miaPPT1CkKGrX97vdRQJG8cOOyDmG6OkYNmTs55lCGpfG1dyzJUTIjJhkzORD3yFWCWG-gvkttv6eoA5JMzqh5PghtvBtlpZBkwzgSro9YhQfW8aM9phW3Yx"})
  response_hash = JSON.parse(response_string)

  businesses = response_hash["businesses"]

end

  restos = show_restos.map do |biz|
    {
      name: biz['name'],
      alias: biz['alias'],
      rating: biz['rating'],
      price: biz['price'],
      address: biz['location']['display_address'].join(', '),
      phone: biz['phone'],
      transactions: biz['transactions'].join(', ')
    }
  end

  restos.each do |r|
    Restaurant.create(r)
  end








# class Restaurant < ActiveRecord::Base


  # restaurants.each do |hash|
  #   Restaurant.new(hash)
  # end



#   list = businesses.map do |business|
#   if business["transactions"].downcase == transxn
#      business["name"]
#    end
#  end
#
#
# end
#
# response = RestClient.get "https://api.yelp.com/v3/businesses/search?term=restaurants&location=houston&limit=1", headers = {content_type: "application/json;charset=utf-8", authorization: "Bearer wN8RA0HKtqL58h7bBAP3-4K3UeZyceVHOB1AvTkvZ-s3bS-qBBCkv4nAyW0hrvhPJ0JQqd2QHOjo1ShuZfNDnCBzvuTsFAN3xppAclXNVS-rLxoQClnM3NmzSspgW3Yx"}

# array = JSON.parse(response.body.businesses)
# array.each { |x| p x.keys }
# x = JSON.parse(response.body)
# binding.pry
