require "rails_helper"

RSpec.describe WelcomeMailerMailer, type: :mailer do
  describe "signup_email" do
    let(:mail) { WelcomeMailerMailer.signup_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Signup email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("Hi")
    end
  end

end
