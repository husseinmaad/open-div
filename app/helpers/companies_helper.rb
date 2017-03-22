module CompaniesHelper

  def sorted_companies
    companies = Company.all
    companies.sort{|company1, company2| company2.avg_rating <=> company1.avg_rating}
  end

  def top_four
    sorted_companies[0..3]
  end

  # Return data of all companies in db for use in autocomplete
  def autocomplete_data
    companies = Company.all
    data = "{"
    companies.each_with_index do |company, index|
      data += "'#{company.name}':'#{company.profile_image_url}'"
      if index < companies.length-1
        data += ","
      end
    end
    data +="}"
  end
end
