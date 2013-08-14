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

	def initialize params={}
		self.title = params[:title] if params.has_key?(:title)
		self.user_id = params[:user_id] if params.has_key?(:user_id)
		self.activation_date = Date.today	
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
		puts "#{JobOffer.all.count}"
		JobOffer.all(:activation_date.lte => Date.today)
	end

end
