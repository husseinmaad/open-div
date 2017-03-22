require 'json'
require_relative '../app/models/crunchbase_handler'

Company.destroy_all
User.destroy_all
Rate.destroy_all

company_data = JSON.parse(CrunchbaseHandler::get_all_sf_companies)
# Create Admin user
admin = User.create first_name: "Admin", last_name: "Admin", email: "admin@admin.com", password: "password", admin: true

# p company_data['data']['items'].last['properties']

company_data['data']['items'].each do |data|
  company = Company.create!(name: data["properties"]["name"],short_description: data["properties"]["short_description"],domain: data["properties"]["domain"], city_name:data["properties"]["city_name"],
  region_name: data["properties"]["region_name"], country_code: data["properties"]["country_code"], creator_id: admin.id, profile_image_url: data["properties"]["profile_image_url"])

end

@companies = Company.all
dimensions = ["gender","identity", "management","hr",
  "whole_self","community","leadership","equal_opportunities",
  "promotions","job_description","responsiveness","onsite","overall"]



@companies.each do |company|
	100.times.each do 
		User.create first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email , password: "password", admin: false
		@user = User.last
		company.reviews.create!(body: Faker::Lorem.paragraph, reviewer_id: @user.id, anonymous: true)

		dimensions.each do |dimension|

			Rate.create!(rater_id: @user.id, rateable_type: "Company", rateable_id: company.id, stars: rand(1...5), dimension: dimension)
			company.update_rate_average(Rate.last.stars, dimension)
		end
	end
end