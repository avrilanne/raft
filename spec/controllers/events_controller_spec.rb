require 'rails_helper'

describe EventsController do
  let!(:event) { Event.create!(name: "It Dinner Yo", host_id: 1)}

  describe "GET #index"  do
    it "responds with status code 200" do
      get :index, { group_id: 1 }
      expect(response).to have_http_status 200
    end
  end

  describe "GET #show"  do
    it "responds with status code 200" do
      get :show, { group_id: 1, id: 1 }
      expect(response).to have_http_status 200
    end
  end

  describe "GET #new"  do
    it "responds with status code 200" do
      get :new, { group_id: 1 }
      expect(response).to have_http_status 200
    end
  end

  # describe "POST #create"  do
  #   it "responds with status code 200" do
  #     post :create, { group_id: 1, id: 1 }
  #     expect(response).to have_http_status 200
  #   end
  # end
end
