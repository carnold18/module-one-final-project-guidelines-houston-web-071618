require 'rest-client'
require 'json'
require 'pry'
#require_relative '../sample'
require_relative '../cli'

def show_restos
  #make the web request
  response_string = RestClient.get('https://api.yelp.com/v3/businesses/search?term=lunch&latitude=29.759100&longitude=-95.363398', headers = {content_type: "application/json;charset=utf-8", authorization: "Bearer gb3UoP4_mDCbbesnotPRvqKRj3R5-kZqGb67P1KlwvdFIp56El2A1xS3hX-z9ZSAzcS7DprwsHr784OZCNosQ_OYNQWZziR-GAebOOJNRjSDMngxFuvc4F8ki-dhW3Yx"})
  response_hash = JSON.parse(response_string)
  businesses = response_hash["businesses"]

end

# def parsing

  restos = show_restos.map do |biz|
    {
      name: biz['name'],
      rating: biz['rating'],
      price: biz['price'],
      address: biz['location']['display_address'].join(', '),
      phone: biz['phone']
    }
  end

  restos.each do |r|
    Restaurant.create(r)
  end

  # binding.pry
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
