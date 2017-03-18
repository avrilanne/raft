require 'rails_helper'

describe UsersController do

  let!(:user) { User.new(first_name: "Jam", last_name: "Nokogiri", username: "jamoko", email: "jamoko@gmail.com", password: "password")}

  describe "GET #new" do
    it "returns a server response of 200" do
      get :new
      expect(response).to have_http_status(200)
    end

    it "renders the new user template" do
      get :new
      expect(response).to render_template(:new)
    end
  end



  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, { user: { first_name: "Jam", last_name: "Nokogiri", username: "jamoko", email: "jamoko@gmail.com", password: "password"} }
        expect(response).to have_http_status 302
      end
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: 1 }
      expect(response).to have_http_status 200
    end
  end
end













