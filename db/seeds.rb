require 'json'
require_relative '../app/models/crunchbase_handler'
#
# file = File.read('db/crunchbase/organizations.json')
# company_data = JSON.parse(file)
#
# puts company_data.length
company_data = JSON.parse(CrunchbaseHandler::get_all_sf_companies)

p company_data['data']['items'].first
