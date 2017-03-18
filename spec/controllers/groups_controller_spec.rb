require 'rails_helper'

describe GroupsController do

  let!(:group) { Group.new(name: "yolo group", admin_id: 1 )}
  let!(:current_user) {User.find_by(id: 1)}

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
        post :create, { group: { name: "Jam", admin_id: 1 } }
        expect(response).to have_http_status 302
      end
    end

    context "when invalid params are passed" do
      it "renders new template" do
        post :create, { group: { admin_id: 1 } }

        expect(response).to render_template(:new)
      end

      it "responds with status code 422" do
        post :create, { group: { admin_id: 1 } }
        expect(response).to have_http_status 422
      end
    end
  end
end
