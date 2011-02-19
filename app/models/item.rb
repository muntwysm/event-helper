class Item < ActiveRecord::Base
	belongs_to :category
	has_many :requirements, :dependent => :destroy
	has_many :contributions, :dependent => :destroy
	has_many :events, :through => :requirements
	has_many :events, :through => :contributions

	validates_presence_of :name, :unit, :category

  named_scope :not_yet_required, lambda { |id|
    { 
      :conditions => ["id NOT IN (SELECT item_id FROM requirements WHERE event_id = ?)",id],
    }
  }

	def name_with_unit
		"#{name} -- #{unit}"
	end

end
