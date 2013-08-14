class TwitterClient

	def self.publish(job_offer)
		Twitter.update("New job offer for #{job_offer.title}!")
	end

end
