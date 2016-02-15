require 'rails_helper'

RSpec.describe BasicExample::TripsController, :type => :controller do
  describe "POST #create" do
    context "with valid params" do
      let(:trip_attributes) { attributes_for(:trip) }

      it "creates a new trip" do
        expect { post :create, {:trip => trip_attributes} }.to change(Trip, :count).by(1)
      end
    end
  end
end
