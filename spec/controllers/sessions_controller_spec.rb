require 'rails_helper'

describe SessionsController do

    let!(:user) { User.create!(first_name: "Jules", last_name: "Nokogiri", username: "jukugiri", email: "jukugiri@gmail.com", password: "password")}


  describe "GET #new" do
    it "returns a server response of 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  # describe "POST #create" do
  #   context "when valid params are passed" do
  #     it "responds with status code 302" do
  #       post :create, {}
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "responds with status code 302" do
  #     delete :destroy, { }

  #   end
  # end








end
