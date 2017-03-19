require 'uri'
require 'net/http'
require 'openssl'
require 'dotenv'

module CrunchbaseHandler
  @key = ENV["CB_KEY"]
  url = "https://api.crunchbase.com/v/3/odm-organizations?user_key=#{@key}&locations=San Francisco&organization_types=company"
  @url_uri = URI(url)

  def self.get_all_sf_companies
    http = Net::HTTP.new(@url_uri.host, @url_uri.port)
    p @url_uri
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(@url_uri)

    response = http.request(request)
    response.read_body
  end

  def self.search(query)
    url += "&query=" + query
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    # request["cache-control"] = 'no-cache'
    # request["postman-token"] = 'a01b58b9-0447-0546-dff0-e1b1f6718739'

    response = http.request(request)
    response.read_body
  end
end
