require 'spec_helper'

describe TwitterClient do
	
	describe 'publish' do

		it 'should make a call to Twitter.update with the correct string' do
			job_offer = JobOffer.new
			job_offer.title = 'Programador Ruby'
			Twitter.should_receive(:update).with('New job offer for Programador Ruby!')
			TwitterClient.publish(job_offer)
		end

	end

end