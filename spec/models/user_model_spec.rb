require 'rails_helper'
describe User do

  let(:user) { User.new(first_name: "Jam", last_name: "Nokogiri", username: "jamoko", email: "jamoko@gmail.com", password: "password")}

  describe "attributes" do
    it "has an first_name" do
      expect(user.first_name).to eq "Jam"
    end

    it "has an last_name" do
      expect(user.last_name).to eq "Nokogiri"
    end

    it "has an username" do
      expect(user.username).to eq "jamoko"
    end

    it "has an email" do
      expect(user.email).to eq "jamoko@gmail.com"
    end

    it "has an password" do
      expect(user.password.length).to be > 0
    end

  end
end


