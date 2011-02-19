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
		  find(:all, :conditions => ['email LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end

end
