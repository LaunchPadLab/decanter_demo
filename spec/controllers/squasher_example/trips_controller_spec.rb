require 'rails_helper'

RSpec.describe SquasherExample::TripsController, :type => :controller do
  describe "POST #create" do
    context "with valid params" do
      let(:trip_attributes) {
        {
          start_day: 15,
          start_month: 1,
          start_year: 2016,
          end_day: 20,
          end_month: 1,
          end_year: 2016,
          name: "My Trip"
        }
      }

      it "creates a new trip" do
        expect { post :create, {:trip => trip_attributes} }.to change(Trip, :count).by(1)
      end
    end
  end
end
