module EventsHelper

	def add_requirement_link(name)
		link_to_function name do |page|
			page.insert_html :bottom, :requirements, :partial => 'requirement' , :object => Requirement.new
		end
	end

	def count_contributions_for(event_id,item_id)
		return Contribution.sum("qty", :conditions => ["event_id = ? AND item_id = ? AND req = true", event_id, item_id])
	end
end
