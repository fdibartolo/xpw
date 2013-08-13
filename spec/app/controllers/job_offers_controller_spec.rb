require 'spec_helper'

describe "JobOffersController" do

	describe 'get :new' do
		
	  it "should response ok and render job_offers/new" do
	  	JobVacancy::App.any_instance.should_receive(:render).with('job_offers/new')
	  	get '/job_offers/new'
	    last_response.should be_ok
	  end
  
  end

  describe 'get :latest' do

    it "should response ok and render only active offers" do
      JobOffer.should_receive(:active).and_return([])
      get '/job_offers/latest'
      # last_response.should be_ok
    end

	end
end
