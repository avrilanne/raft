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

    context "when invalid params are passed" do
      it "renders new template" do
        post :create, { user: { first_name: "Jam", last_name: "Nokogiri", username: "jamoko", email: "jamoko@gmail.com"} }
        expect(response).to render_template(:new)
      end

      it "responds with status code 422" do
        post :create, { user: { first_name: "Jam", last_name: "Nokogiri", username: "jamoko", email: "jamoko@gmail.com"} }
        expect(response).to have_http_status 422
      end

    end

  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: 1 }
      expect(response).to have_http_status 200
    end

    it "renders the :show template" do
      get :show, { id: 1}
      expect(response).to render_template(:show)
    end

  end
end













