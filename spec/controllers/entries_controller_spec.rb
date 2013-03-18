require 'spec_helper'

describe EntriesController do
  context "#index" do
    let(:entry) { FactoryGirl.build(:entry) }
    let(:params) { {search: {user: 123}} }

    it "filters on the given search criteria" do
      Entry.should_receive(:periscope).with(params[:search]) { [entry] }
      get :index, params
      expect(assigns[:entries]).to eq([entry])
    end

    it "responds to HTML requests"

    it "responds to JSON requests"

    it "paginates results"
  end
end
