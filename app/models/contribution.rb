class Contribution < ActiveRecord::Base
	belongs_to :event
	belongs_to :item

	validates_presence_of :item_id, :qty, :email

	validates_numericality_of :qty, :only_integer => true, :message => "can only be whole number."

	EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	#validates_format_of   :email, :with => EmailRegex

	default_scope :order => 'created_at DESC'

	def self.search(search)
		if search
		  find(:all, :conditions => ['LOWER(email) LIKE ?', "%#{search.downcase}%"])
		else
			find(:all)
		end
	end

	def self.get_info(contribution)
		required = false
		requirement = Requirement.all(:conditions => ["event_id = ? AND item_id = ?", contribution.event_id, contribution.item_id])
		required = true if requirement.any?

		if contribution.req and required
			return "This contribution is gladly accepted, thank you!"
		elsif required
			return "This contribution is no longer required because the Administrator has changed some of the qantities required. If this was your contribution, you may wish to 'Destroy' it, as it no longer needs to be recorded."	
		else
			return "This contribution is no longer required because #{contribution.item.name} have been removed from the Event Requirements. If this was your contribution, you may wish to 'Destroy' it, as it no longer needs to be recorded."	
		end
	end
end
