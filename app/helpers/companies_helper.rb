module CompaniesHelper

  def sorted_companies
    companies = Company.all
    companies.sort{|company1, company2| company2.avg_rating <=> company1.avg_rating}
  end

  def top_four
    sorted_companies[0..3]
  end
end
