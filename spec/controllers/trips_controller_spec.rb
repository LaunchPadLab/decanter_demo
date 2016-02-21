require 'rails_helper'

RSpec.describe TripsController, :type => :controller do

  describe '#create' do
    it 'creates a new trip' do
      trip_attributes = attributes_for(:trip)
      expect { post :create, { trip: trip_attributes } }.to change { Trip.count }.by 1
    end
  end
end
