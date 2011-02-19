class Event < ActiveRecord::Base
	belongs_to :location
	has_many :requirements, :dependent => :destroy
	has_many :items, :through => :requirements
	accepts_nested_attributes_for :requirements, :reject_if => :any_blank, :allow_destroy => true

	has_many :contributions, :dependent => :destroy
	has_many :items, :through => :contributions
	accepts_nested_attributes_for :contributions, :allow_destroy => true

	validates_presence_of :name, :location_id, :date

	def name_with_location_date
		"#{name} --- #{location.name} --- #{date}"
	end

	def new_requirement_attributes=(requirement_attributes)
		requirement_attributes.each do |attributes|
			requirements.build(attributes)
		end
	end

  def existing_requirement_attributes=(requirement_attributes)
    requirements.reject(&:new_record?).each do |requirement|
      attributes = requirement_attributes[requirement.id.to_s]
      if attributes
        requirement.attributes = attributes
      else
        requirement.delete
      end
    end
  end

  def save_requirements
    requirements.each do |requirement|
      requirement.save(false)
    end
  end


	def total_contributions_for(item_id,event_id)
		return Contribution.sum("qty", :conditions => ["event_id = ? AND item_id = ?", event_id, item_id])
	end

	def contribution_less_than_required_for(item_id, event_id)
		result = false
		c = total_contributions_for(item_id, event_id)
		r = Requirement.all( :conditions => ["event_id = ? AND item_id = ?", event_id, item_id])
		result = true if c < r.first.qty
		return result
	end

	def contributions_still_required_for(item_id, event_id)
		c = total_contributions_for(item_id, event_id)
		r = Requirement.all( :conditions => ["event_id = ? AND item_id = ?", event_id, item_id])
		return r.first.qty - c
	end

end
