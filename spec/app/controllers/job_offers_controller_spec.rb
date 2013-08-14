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

  describe 'post :create' do

  	it 'should post to twitter, if asked to publish to twitter, and save is true' do
  		JobOffer.any_instance.stub(:save).and_return(true)
  		TwitterClient.should_receive(:publish)
  		post '/job_offers/create', { :job_offer => { :title => 'Programador Ruby' }, :to_twitter => 'Create and Twitter' }
  	end

  	it 'should not post to twitter, if not asked to publish to twitter, and save is true' do
  		JobOffer.any_instance.stub(:save).and_return(true)
  		TwitterClient.should_not_receive(:publish)
  		post '/job_offers/create', { :job_offer => { :title => 'Programador Ruby' } }
  	end

  	it 'should not post to twitter, if asked to publish to twitter, and save is false' do
  		JobOffer.any_instance.stub(:save).and_return(false)
  		TwitterClient.should_not_receive(:publish)
  		post '/job_offers/create', { :job_offer => { :title => 'Programador Ruby' }, :to_twitter => 'Create and Twitter' }
  	end

  end

end
