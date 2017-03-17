require 'rails_helper'
describe User do

  let(:user) { User.new (first_name: "Jam", last_name: "Nokogiri", username: "jamoko", email: "jamoko@gmail.com", password: "password")}

  describe "attributes" do
    it "has an email" do
      expect(user.email).to eq "jamoko@gmail.com"
    end

  end
end
