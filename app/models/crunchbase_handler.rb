require 'uri'
require 'net/http'

module CrunchbaseHandler
  @key = ENV['CB_KEY']
  url = URI("https://api.crunchbase.com/v/3/odm-organizations?user_key=#{@key}")
  
  def self.get_all companies
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    # request["cache-control"] = 'no-cache'
    # request["postman-token"] = 'a01b58b9-0447-0546-dff0-e1b1f6718739'

    response = http.request(request)
    puts response.read_body
  end

  def self.search(query)

  end
end
