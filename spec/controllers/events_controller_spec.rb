require 'rails_helper'

describe EventsController do
  let!(:event) { Event.create!(name: "It Dinner Yo", host_id: 1)}

  describe "GET #index"  do
    it "responds with status code 200" do
      get :index
      expect(response).to_have_http_status 200
    end


  end
end
