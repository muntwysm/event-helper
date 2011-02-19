class Requirement < ActiveRecord::Base
	belongs_to :event
	belongs_to :item

	validates_presence_of :item_id, :qty
	validates_numericality_of :qty, :only_integer => true, :message => "can only be whole number."

end
