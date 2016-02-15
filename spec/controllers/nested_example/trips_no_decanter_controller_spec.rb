require 'rails_helper'

RSpec.describe NestedExample::TripsNoDecanterController, :type => :controller do
  describe "POST #create" do
    context "with valid params" do
      let(:first_destination) { attributes_for(:destination) }
      let(:second_destination) { attributes_for(:destination) }
      let(:final_destination) { attributes_for(:destination) }
      let(:destinations_attributes) {
        [first_destination, second_destination, final_destination]
      }

      let(:trip_attributes) { attributes_for(:trip, destinations_attributes: destinations_attributes) }

      it "creates a new trip" do
        expect { post :create, {:trip => trip_attributes} }.to change(Trip, :count).by(1)
      end
    end
  end
end
