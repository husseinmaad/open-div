require 'uri'
require 'net/http'
require 'openssl'
require 'dotenv'

module CrunchbaseHandler
  @key = ENV["CB_KEY"]

  def self.get_companies_by_city(city,page)
    url = "https://api.crunchbase.com/v/3/odm-organizations?user_key=#{@key}&query=#{ city }&page=#{ page.to_s }"
    url_uri = URI(url)
    http = Net::HTTP.new(url_uri.host, url_uri.port)

    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url_uri)
    response = http.request(request)
    response.read_body
  end

  def self.search(query)
    url = "https://api.crunchbase.com/v/3/odm-organizations?user_key=#{@key}&query=" + query
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)

    response = http.request(request)
    response.read_body
  end

  def self.save_companies_to_db(query,pages,admin)
    pages.times do |i|
      # Print out page you are parsing
      p "Going through page #{i+1} for #{query}"
      # parse page
      page = JSON.parse(CrunchbaseHandler::get_companies_by_city(query,i+1))
      # if page was parsed
      if page
        # loop through items and create company
        page['data']['items'].each_with_index do |data, index|
          if index < 50 && data["properties"]["primary_role"] == "company" && data["properties"]["profile_image_url"] &&
             data["properties"]["city_name"] && data["properties"]["region_name"] && data["properties"]["country_code"]
            company = Company.create!(name: data["properties"]["name"],short_description: data["properties"]["short_description"],domain: data["properties"]["domain"], city_name: data["properties"]["city_name"],
            region_name: data["properties"]["region_name"], country_code: data["properties"]["country_code"], creator_id: admin.id, profile_image_url: data["properties"]["profile_image_url"])
          end
        end
        # end of loop
      end # end of page
    end # end of page loop
  end
end
