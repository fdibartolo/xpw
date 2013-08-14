require 'spec_helper'

describe JobOffer do

	describe 'model' do

		subject { @job_offer = JobOffer.new }

		it { should respond_to( :id) }
		it { should respond_to( :title ) }
		it { should respond_to( :location) }
		it { should respond_to( :description ) }
		it { should respond_to( :owner ) }
		it { should respond_to( :owner= ) }
		it { should respond_to( :activation_date ) }

	end

	describe 'valid?' do

	  let(:job_offer) { JobOffer.new }

	  it 'should be false when title is blank' do
	  	puts job_offer.owner
	  	job_offer.valid?.should be_false
	  end

	end

	describe 'filtering' do
	  before :each do
	  	JobOffer.destroy!
			@job_offer = JobOffer.new title: 'some title', user_id: 1
		end

		it "should not find offers for tomorrow" do
			@job_offer.activation_date = Date.today.next
			@job_offer.save
			JobOffer.active.should be_empty
		end

		it "should find offers for today" do
			@job_offer.activation_date = Date.today
			@job_offer.save
			JobOffer.active.first.id.should == @job_offer.id
		end

		it "should not find offers when activation_date more than 30 days before today" do
			@job_offer.activation_date = Date.today - 31
			@job_offer.save
			JobOffer.active.should be_empty
		end
	end

	describe "initialization" do
		it "activation_date should default to today" do
			job_offer = JobOffer.initialize_with_default_date
			job_offer.activation_date.should == Date.today
		end
	end

end
