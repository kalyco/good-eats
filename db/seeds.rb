# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env.development?
  Restaurant.find_or_create_by(name: "omnomnom",
  address: "1 something place", city: "placesville", state: "WY", zipcode: "00123")
  Restaurant.find_or_create_by(name: "other place!",
  address: "1 something place", city: "placesville", state: "WY", zipcode: "00123")
end
