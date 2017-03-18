require 'rails_helper'

describe EventsController do
  let!(:event) { Event.create!(location: "space", date: "yellow", time: "hello", group_id: 1, name: "It Dinner Yo", host_id: 1)}
  let!(:group) { Group.create!(admin_id: 1, event_id: 1, name: "yolo")}

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

  describe "POST #create"  do
    it "responds with status code 302" do
      post :create, { group_id: 1 }, {location: event.location, date: event.date, time: event.time, name: event.name, host_id: event.host_id}
      expect(response).to have_http_status 302
    end

    it "responds with status code 422 when it fails" do
      post :create
      expect(response).to have_http_status 422
    end
  end
end
