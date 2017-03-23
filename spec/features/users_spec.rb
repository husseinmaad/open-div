require 'rails_helper'

RSpec.feature "Users", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  user = User.create(first_name: "Admin", last_name: "Admin", email: "admin@admin.com", password: "123456", admin: true)
  company = Company.create(name: "VoiLaw", short_description: "VoiLaw is a mobile application that provides a guide to the laws of the 50 states in an easy-to-understand and concise format.", domain: nil, city_name: "San Francisco", region_name: "California", country_code: "United States", profile_image_url: "http://public.crunchbase.com/t_api_images/v1477650628/dma2pm1hbrkupdnuqpa1.png", creator_id: 1)

  describe "user can sign in" , :type => :feature do
    it "user can sign in" do
      visit '/users/sign_in'
      fill_in "Email", with: "admin@admin.com"
      fill_in "Password",with: "123456"
      # save_and_open_screenshot
      click_button 'Log in'
      expect(page).to have_content 'Signed in'
    end

    it "user can view and rate the company after signed in" do
  	 	visit '/users/sign_in'
      fill_in "Email", with: "admin@admin.com"
      fill_in "Password",with: "123456"
      click_button 'Log in'
      visit new_company_review_path(company)
      expect(page).to have_content 'Your Ratings for'
    end


    # it "user can view and rate the company after signed in" do
    # visit '/users/sign_in'
    # fill_in "Email", with: "admin@admin.com"
    # fill_in "Password",with: "123456"
    # click_button 'Log in'
    # visit new_company_review_path(company)
    # binding.pry
    #   within(".rating_questions") do
    #     find('div[data-dimension="gender"] img[alt="3"]').click



    #   end
    #   expect(page.find('div[data-dimension="gender"] input[name="score"]') ).to have_field ('input[value = "4"]')

    # end

  end



end


