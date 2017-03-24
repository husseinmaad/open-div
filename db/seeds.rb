require 'json'
require_relative '../app/models/crunchbase_handler'

Company.destroy_all
User.destroy_all
Rate.destroy_all

# company_data = JSON.parse(CrunchbaseHandler::get_companies_by_city("San Francisco"))
# Create Admin user
# admin = User.create first_name: "Admin", last_name: "Admin", email: "admin@admin.com", password: "password", admin: true

# p company_data['data']['paging']['number_of_pages']
# CrunchbaseHandler::save_companies_to_db("Mountain View",1)

admin = User.create first_name: "Admin", last_name: "Admin", email: "admin@admin.com", password: "password", admin: true
users =[ User.create first_name: "Zaw", last_name: "Lwin", email: "zaw@zaw.com", password: "password", admin: false ,
User.create first_name: "Hussein", last_name: "al-sammaraie", email: "huss@huss.com", password: "password", admin: false ,
User.create first_name: "Lupita", last_name: "davila", email: "lupita@lupita.com", password: "password", admin: false ,
User.create first_name: "Alex", last_name: "Gonzalez", email: "alex@alex.com", password: "password", admin: false ,
User.create first_name: "Raul", last_name: "Fm", email: "raul@raul.com", password: "password", admin: false 
]

review_array = [ 
  "I like this company",
  "I love to work there" , 
  " It is ok " , 
  " Overall acceptable",
"Not enjoying "]

CrunchbaseHandler::save_companies_to_db("Edmodo",1, admin)
CrunchbaseHandler::save_companies_to_db("Roostify",1, admin)
CrunchbaseHandler::save_companies_to_db("eat24",1, admin)
CrunchbaseHandler::save_companies_to_db("Yelp platform",1, admin)
CrunchbaseHandler::save_companies_to_db("Yardi",1, admin)
CrunchbaseHandler::save_companies_to_db("linkedin professional networking site",1, admin)
CrunchbaseHandler::save_companies_to_db("Adobe Systems Digital",1, admin)
CrunchbaseHandler::save_companies_to_db("Dev Bootcamp",1, admin)
CrunchbaseHandler::save_companies_to_db("Macy's Omnichannel",1, admin)
CrunchbaseHandler::save_companies_to_db("Uber mobile app drivers",1, admin)
CrunchbaseHandler::save_companies_to_db("Lyft",1, admin)
CrunchbaseHandler::save_companies_to_db("Tinder anonymously",1, admin)
CrunchbaseHandler::save_companies_to_db("airbnb listing marketplace book",1, admin)
CrunchbaseHandler::save_companies_to_db("San Francisco",3, admin)

companies = Company.all
dimensions = ["gender","identity", "management","hr",
  "whole_self","community","leadership","equal_opportunities",
  "promotions","job_description","responsiveness","onsite","overall"]



companies.each_with_index do |company, index|
  if index <= 40
  	users.each do
  		company.reviews.create!(body: review_array.sample , reviewer_id: user.id, anonymous: true)
  		dimensions.each do |dimension|

  			Rate.create!(rater_id: user.id, rateable_type: "Company", rateable_id: company.id, stars: rand(3...5), dimension: dimension)
  			company.update_rate_average(Rate.last.stars, dimension)
  		end
  	end
  end
end
# companies.each_with_index do |company, index|
#   if index <= 40
#     5.times.each do
#       user = User.create! first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email , password: "password", admin: false
#       company.reviews.create!(body: Faker::Lorem.paragraph, reviewer_id: user.id, anonymous: true)

#       dimensions.each do |dimension|

#         Rate.create!(rater_id: user.id, rateable_type: "Company", rateable_id: company.id, stars: rand(3...5), dimension: dimension)
#         company.update_rate_average(Rate.last.stars, dimension)
#       end
#     end
#   end
# end
