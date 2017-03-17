require 'rails_helper'

describe Event do
  let(:event) { Event.new }

  describe "event attributes" do
    it "Event has host_id" do
      event.host_id = 1
      event.save
      expect(event.host_id).to eq 1
    end

    it "Event has a name" do
      event.name = "YOLO TIME"
      event.save
      expect(event.name).to eq "YOLO TIME"
    end

  end
end
