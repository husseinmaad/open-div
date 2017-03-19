require 'json'
require_relative '../app/models/crunchbase_handler'

Company.destroy_all
User.destroy_all

company_data = JSON.parse(CrunchbaseHandler::get_all_sf_companies)
# Create Admin user
admin = User.create first_name: "Admin", last_name: "Admin", email: "admin@admin.com", password: "password", admin: true

# p company_data['data']['items'].last['properties']

company_data['data']['items'].each do |data|
  company = Company.create!(name: data["properties"]["name"],short_description: data["properties"]["short_description"],domain: data["properties"]["domain"], city_name:data["properties"]["city_name"],
  region_name: data["properties"]["region_name"], country_code: data["properties"]["country_code"], creator_id: admin.id, profile_image_url: data["properties"]["profile_image_url"])
  company.reviews.create!(body: Faker::Lorem.sentences, reviewer_id: admin.id, 
                          culture_rating: rand(1..5),diversity_rating:rand(1..5),inclusion_rating: rand(1..5),
                          anonymous: true)
end

