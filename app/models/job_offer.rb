class JobOffer
	include DataMapper::Resource

	# property <name>, <type>
	property :id, Serial
	property :title, String
	property :location, String
	property :description, String
	property :activation_date, Date
	belongs_to :user

	validates_presence_of :title

	def self.initialize_with_default_date
		job_offer = JobOffer.new
		job_offer.activation_date = Date.today	
		job_offer
	end

	def owner
		user
	end

	def owner=(a_user)
		self.user = a_user
	end

	def self.find_by_owner(user)
		JobOffer.all(:user => user)
	end

	def self.active
		JobOffer.all(:activation_date.lte => Date.today, :activation_date.gt => Date.today - 30)
	end

end
